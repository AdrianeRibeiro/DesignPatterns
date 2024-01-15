class CharacterWithoutBuilder
  attr_accessor :character_class, :race, :weapon, :skills, :background

  def initialize(character_class = nil, race = nil, weapon = nil, skills = [], background = nil)
    @character_class = character_class
    @race = race
    @weapon = weapon
    @skills = skills
    @background = background
  end
end

class Character
  attr_accessor :character_class, :race, :weapon, :skills, :background

  def initialize
    @skills = []
  end

  def description
    "Um #{character_class} #{race}, ex #{background}
    armado com #{weapon}
    e habilidades: #{skills.join(', ')}"
  end
end

class CharacterBuilder
  def initialize
    @character = Character.new
  end

  def class(character_class)
    @character.character_class = character_class
  end

  def race(race)
    @character.race = race
  end

  def weapon(weapon)
    @character.weapon = weapon
  end

  def background(background)
    @character.background = background
  end

  def add_skill(skill)
    @character.skills << skill
  end

  def build
    @character
  end
end

# Exemplo de uso
builder = CharacterBuilder.new
builder.class('Guerreiro')
builder.race('Elfo')
builder.weapon('Espada Mágica')
builder.add_skill('Corte Duplo')
builder.add_skill('Defesa Heroica')
builder.background('Vagabundo')
character = builder.build

puts character.description
