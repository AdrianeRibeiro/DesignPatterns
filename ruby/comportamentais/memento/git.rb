# Exemplo retirado de https://medium.com/@kroolar/design-patterns-in-ruby-memento-64cb11a48baf

# Memento
class Commit
  attr_reader :state, :id
  
  def initialize(state)
    @state = state
    @id = generate_id
  end

  private

  def generate_id
    Random.new_seed.digits[0...4].join.to_i
  end
end

# Caretaker
class Repository
  def initialize
    @commits = []
  end

  # Show all commits
  def log
    puts "commits: #{@commits}"
    @commits
  end

  # Add new commit
  def add(commit)
    @commits << commit
  end

  # Find commit by ID
  def commit(id)
    @commits.find { |c| c.id == id }
  end
end

# Originator
class Editor
  attr_accessor :state, :repo

  def initialize
    @state = ''
  end

  # Create new repository
  def init_repo
    @repo = Repository.new

    puts "Creating new repository \n"
  end

  # Create commit and add to repository
  def commit
    new_commit = Commit.new(state)

    puts "Adding new commit: #{new_commit} \n"
    repo.add(new_commit)
  end

  # Restore state from specific commit
  def checkout(id)
    puts "Adding state #{id} \n"

    @state = repo.commit(id)&.state
  end
end

editor = Editor.new

# Initialize repository
editor.init_repo

# Set new editor state
editor.state = "Hello World!"

# Create commit of current state, it's ID and save it in the Repo
editor.commit

# Create and commit new state
editor.state = "Hello Mars!"
editor.commit

# Now we can log into a repo history
editor.repo.log

# When we know the id of the commit we want to restore we can use it
editor.checkout(3226)
editor.state # => Hello World!