class Temperature
  attr_reader :degrees

  def initialize(degrees)
    @degrees = degrees
  end
end

class CelsiusTemperature < Temperature
end

class TemperatureAdapter
  def to_celsius
    not_implemented_error
  end

  private

  def not_implemented_error
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end

class FahrenheitToCelsiusAdapter < TemperatureAdapter
  def initialize(fahrenheit_temperature)
    @fahrenheit_temperature = fahrenheit_temperature
  end

  def to_celsius
    celsius = (@fahrenheit_temperature.degrees - 32) * 5 / 9
    CelsiusTemperature.new(celsius)
  end
end

class KelvinToCelsiusAdapter < TemperatureAdapter
  def initialize(kelvin_temperature)
    @kelvin_temperature = kelvin_temperature
  end

  def to_celsius
    celsius = @kelvin_temperature.degrees - 273.15
    CelsiusTemperature.new(celsius)
  end
end

class TemperatureClient
  def convert_to_celsius(adapter)
    adapter.to_celsius
  end
end

client = TemperatureClient.new

fahrenheit_temp = Temperature.new(68)
fahrenheit_adapter = FahrenheitToCelsiusAdapter.new(fahrenheit_temp)
celsius_temp = client.convert_to_celsius(fahrenheit_adapter)
puts "#{fahrenheit_temp.degrees}°F é igual a #{celsius_temp.degrees}°C."

kelvin_temp = Temperature.new(293.15)
kelvin_adapter = KelvinToCelsiusAdapter.new(kelvin_temp)
celsius_temp = client.convert_to_celsius(kelvin_adapter)
puts "#{kelvin_temp.degrees}°K é igual a #{celsius_temp.degrees}°C."
