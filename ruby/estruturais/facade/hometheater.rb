# Subsistema de Luzes
class Lights
  def turn_on
    puts "Lights ON"
  end

  def turn_off
    puts "Lights OFF"
  end
end
  
# Subsistema de Som
class SoundSystem
  def turn_on
    puts "SoundSystem ON"
  end

  def turn_off
    puts "SoundSystem OFF"
  end
end
  
# Subsistema de Projeção
class Projector
  def turn_on
    puts "Projector ON"
  end

  def turn_off
    puts "Projector OFF"
  end
end
  
  # Fachada para o Home Theater
class HomeTheaterFacade
  def initialize(lights, sound_system, projector)
    @lights = lights
    @sound_system = sound_system
    @projector = projector
  end

  def watch_movie
    puts "Get ready to watch a movie!"

    @lights.turn_off
    @sound_system.turn_on
    @projector.turn_on
  end

  def end_movie
    puts "Hope you enjoyed the movie!"

    @lights.turn_on
    @sound_system.turn_off
    @projector.turn_off
  end
end

# Exemplo de uso

# Criando instâncias dos subsistemas
lights = Lights.new
sound_system = SoundSystem.new
projector = Projector.new

# Criando a fachada do Home Theater
home_theater = HomeTheaterFacade.new(lights, sound_system, projector)

# Cliente interage com a fachada
home_theater.watch_movie

puts "\nMovie is over. Let's clean up."
home_theater.end_movie