# Exemplo retirado de https://medium.com/@kroolar/design-patterns-in-ruby-mediator-648a69c7f28d

class Airplane
  attr_reader :code
  attr_accessor :tower #mediator

  def initialize(code:)
    @code = code
  end

  def request_takeoff
    tower.request_takeoff(self)
  end
end

class Runway
  attr_reader :code, :status
  attr_accessor :tower

  def initialize(code:, status: 'Available')
    @code, @status = code, status
  end

  def prepare_for_takeoff
    @status = 'Busy'
  end
end

class ControlTower
  attr_reader :code, :airplanes, :runways

  def initialize(code:)
    @code, @airplanes, @runways = code, [], []
  end

  def add_airplane(airplane)
    @airplanes << airplane
    airplane.tower = self
  end

  def add_runway(runway)
    @runways << runway
    runway.tower = self
  end

  def request_takeoff(airplane)
    puts("#{airplane.code} send takeoff request!")

    notify_available_runway
  end

  def notify_available_runway
    available_runway.prepare_for_takeoff
  end

  private

  def available_runway
    runways.find do|runway|
      runway.status == 'Available'
    end || raise('There are no available runways!')
  end
end

# Create airplanes
tupolev = Airplane.new(code: 'T154')
boeing = Airplane.new(code: 'B738')
airbus = Airplane.new(code: 'A318')

# Create runways
runway_a = Runway.new(code: 'RUNWAY_A')
runway_b = Runway.new(code: 'RUNWAY_B')

# Create tower
tower = ControlTower.new(code: 'TOWER_A')

# Add airplanes to tower
tower.add_airplane(tupolev)
tower.add_airplane(boeing)
tower.add_airplane(airbus)

# Add runways to tower
tower.add_runway(runway_a)
tower.add_runway(runway_b)

# Request takeoffs
tupolev.request_takeoff # => T154 send takeoff request!run
runway_a.status # => Busy

boeing.request_takeoff
runway_b.status # => Busy

# Raise an error when there are no available runways
airbus.request_takeoff # => RuntimeError: There are no available runways!