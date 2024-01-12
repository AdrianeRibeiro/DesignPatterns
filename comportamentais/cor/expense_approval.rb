class ExpenseApproval
  attr_accessor :successor
  attr_reader :approval_limit

  def initialize(approval_limit)
    @approval_limit = approval_limit
    @successor = nil
  end

  def approve_expense(expense_amount)
    if expense_amount <= approval_limit
      puts "#{self.class} aprovou a despesa de R$ #{expense_amount}."
    elsif @successor
      @successor.approve_expense(expense_amount)
    else
      puts "Nenhum gerente pode aprovar a despesa de R$ #{expense_amount}."
    end
  end
end

class JuniorManager < ExpenseApproval
  APPROVAL_LIMIT = 10000

  def initialize
    super(APPROVAL_LIMIT)
  end
end

class SeniorManager < ExpenseApproval
  APPROVAL_LIMIT = 50000

  def initialize
    super(APPROVAL_LIMIT)
  end
end

class Director < ExpenseApproval
  APPROVAL_LIMIT = 100000

  def initialize
    super(APPROVAL_LIMIT)
  end
end

class ExpenseApprovalClient
  def initialize
    junior_manager = JuniorManager.new
    senior_manager = SeniorManager.new
    director = Director.new

    junior_manager.successor = senior_manager
    senior_manager.successor = director

    @approver_chain = junior_manager
  end

  def submit_expense_request(expense_amount)
    @approver_chain.approve_expense(expense_amount)
  end
end

# Exemplo de uso
client = ExpenseApprovalClient.new

client.submit_expense_request(8000)   # Aprovado pelo Gerente Júnior
client.submit_expense_request(30000)  # Aprovado pelo Gerente Sênior
client.submit_expense_request(70000)  # Aprovado pelo Diretor
client.submit_expense_request(150000) # Nenhum gerente pode aprovar essa despesa
