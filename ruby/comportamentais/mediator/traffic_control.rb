# Mediator
class TrafficControlTower
  def initialize
    @semaphore = Semaphore.new(self)
    @vehicles = []
    @pedestrians = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def add_pedestrian(pedestrian)
    @pedestrians << pedestrian
  end

  def vehicle_arrived(vehicle)
    @semaphore.allow_passage
  end

  def pedestrian_crossing_request(pedestrian)
    @semaphore.allow_pedestrian_crossing
  end
end
  
# Colleague - Vehicle
class Vehicle
  attr_reader :mediator

  def initialize(mediator)
    @mediator = mediator
    mediator.add_vehicle(self)
  end

  def arrive_at_intersection
    puts "Vehicle arrived at the intersection"
    @mediator.vehicle_arrived(self)
  end
end
  
# Colleague - Pedestrian
class Pedestrian
  attr_reader :mediator

  def initialize(mediator)
    @mediator = mediator
    mediator.add_pedestrian(self)
  end

  def request_crossing
    puts "Pedestrian requested crossing"
    @mediator.pedestrian_crossing_request(self)
  end
end
  
# Semaphore - Mediator
class Semaphore
  def initialize(mediator)
    @mediator = mediator
    @allow_passage = false
    @allow_pedestrian_crossing = false
  end

  def allow_passage
    @allow_passage = true
    puts "Semaphore allows vehicle passage"
  end

  def allow_pedestrian_crossing
    @allow_pedestrian_crossing = true
    puts "Semaphore allows pedestrian crossing"
  end
end
  
# Usage
traffic_control = TrafficControlTower.new
vehicle1 = Vehicle.new(traffic_control)
vehicle2 = Vehicle.new(traffic_control)
pedestrian = Pedestrian.new(traffic_control)

vehicle1.arrive_at_intersection
pedestrian.request_crossing
vehicle2.arrive_at_intersection
  