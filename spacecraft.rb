class Spacecraft
  attr_reader :name, :load_capacity, :fuel_capacity, :available_storage, :crew
  attr_accessor :fuel_amount

  def initialize(name, load_capacity, fuel_capacity)
    @name = name
    @load_capacity = load_capacity
    @fuel_capacity = fuel_capacity
    @fuel_amount = 0
    @available_storage = @load_capacity
    @crew = []
  end

  def take_fuel(gallons)
    @fuel_amount += gallons
    if @fuel_amount > @fuel_capacity
      @fuel_amount = @fuel_capacity
    end
  end

  def tank_full?
    @fuel_amount == @fuel_capacity
  end

  def add_crew_members(*crew_members)
    @crew += crew_members
  end
end