# Exemplo retirado de https://dev.to/daviducolo/mastering-common-and-advanced-ruby-design-patterns-a-comprehensive-guide-with-code-examples-17l0

class Light
  def on
    puts 'Light is on'
  end

  def off
    puts 'Light is off'
  end
end

class Command
  def execute
    raise NotImplementedError, "#{self.class} has not implemented method 'execute'"
  end
end

class LightOnCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.on
  end
end

class LightOffCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.off
  end
end

class RemoteControl
  def initialize
    @commands = []
  end

  def add_command(command)
    @commands << command
  end

  def execute_commands
    @commands.each(&:execute)
  end
end

# Usage
light = Light.new
light_on = LightOnCommand.new(light)
light_off = LightOffCommand.new(light)

remote = RemoteControl.new
remote.add_command(light_on)
remote.add_command(light_off)

remote.execute_commands