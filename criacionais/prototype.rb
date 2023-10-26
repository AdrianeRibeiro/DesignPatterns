class Potion
  attr_accessor :name, :ingredients

  def initialize(name, ingredients)
    @name = name
    @ingredients = ingredients
  end

  def clone
    not_implemented_error
  end

  private

  def not_implemented_error
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

class PolyJuicePotion < Potion
  attr_accessor :final_ingredient

  def initialize(final_ingredient)
    super('PolyJuicePotion', ingredients)
    @final_ingredient = final_ingredient
  end

  def clone(final_ingredient = nil)
    cloned_potion = dup
    cloned_potion.final_ingredient = final_ingredient unless final_ingredient.nil?
    cloned_potion
  end

  def ingredients
    [
      'Fluxweed',
      'Knotgrass',
      'Lacewing flies',
      'Leeches',
      'Horn of Bicorn',
      'Boomslang skin'
    ]
  end
end

# Exemplo de uso
original_potion = PolyJuicePotion.new('Hair of Harry Potter')
cloned_potion = original_potion.clone('Toenail of Hermione Granger')

puts "Poção Original: #{original_potion.name}
  Ingredientes: #{original_potion.ingredients.join(', ')}
  Pedaço da Pessoa: #{original_potion.final_ingredient} \n"

puts "Poção Clonada: #{cloned_potion.name}
  Ingredientes: #{cloned_potion.ingredients.join(', ')},
  Pedaço da Pessoa: #{cloned_potion.final_ingredient}"
