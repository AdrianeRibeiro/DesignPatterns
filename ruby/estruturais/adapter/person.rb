class OmieNotify
  def client(omie_params)
    client_adapter = ClientAdapter.new(omie_params)
    person_data = client_adapter.adapt
    Person.new(person_data)
  end
end

class ClientAdapter
  def initialize(data)
    @data = data
  end

  def adapt
    {
      first_name: first_name,
      last_name: last_name,
      email: @data[:email],
      phone: phone,
      cpf: @data[:cnpj_cpf]
    }
  end

  def first_name
    @data[:razao_social].split[0]
  end

  def last_name
    @data[:razao_social].split[1..-1].join(' ')
  end

  def phone
    @data[:telefone1_ddd].to_s + @data[:telefone1_numero].to_s
  end
end

class Person
  attr_reader :first_name, :last_name, :email, :phone, :cpf

  def initialize(first_name:, last_name:, email:, phone:, cpf:)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @cpf = cpf
  end

  def to_s
    "Nome: #{@first_name} #{@last_name}
    E-mail: #{@email}
    Telefone:  #{@phone}
    CPF: #{@cpf}"
  end
end

params = { razao_social: 'Fernando Claudio Cardoso', cnpj_cpf: '613.218.440-69', pessoa_fisica: 'S', codigo_cliente_omie: 111, email: 'fernandoclaudiocardoso@alcoa.com.br', telefone1_ddd: '44', telefone1_numero: '47445544', dadosBancarios: { agencia: '123' }, recomendacoes: {}, enderecoEntrega: {} }
person = OmieNotify.new.client(params)
puts person.to_s
