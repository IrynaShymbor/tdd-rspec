require_relative '../spacecraft'

describe Spacecraft do
  let(:name) { 'Test ship' }
  let(:load_capacity) { 25_000 }
  let(:fuel_capacity) { 75_000 }

  before(:example) do
    @spacecraft = Spacecraft.new(name, load_capacity, fuel_capacity)
  end

  context 'on initialize' do
    it 'should be an instance of a Spacecraft' do
      expect(@spacecraft).to be_a Spacecraft
    end
  
    it 'should initialize with a name' do
      expect(@spacecraft.name).to eq("Test ship")
    end
  
    it 'should initialize with a loading capacity' do
      expect(@spacecraft.load_capacity).to eq(load_capacity)
    end
  
    it 'should initialize with a fuel capacity' do
      expect(@spacecraft.fuel_capacity).to eq(fuel_capacity)
    end

    it 'should initialize with empty tank' do
      expect(@spacecraft.fuel_amount).to eq(0)
    end

    it 'should initialize with empty storage' do
      expect(@spacecraft.available_storage).to eq(load_capacity)
    end

    it 'does not have a crew assigned' do
      expect(@spacecraft.crew).to be_empty
    end
  end

  context 'fuel methods' do
    it 'is possible to change fuel amount' do
      @spacecraft.fuel_amount = 20
      expect(@spacecraft.fuel_amount).to eq(20)
    end

    describe '#take_fuel' do
      it 'takes fuel amount less than or equal to fuel capacity' do
        @spacecraft.take_fuel(50_000)
        expect(@spacecraft.fuel_amount).to eq(50_000)
      end

      it "doesn't take any fuel over the tank capacity" do
        @spacecraft.fuel_amount = 50_000
        @spacecraft.take_fuel(50_000)
        expect(@spacecraft.fuel_amount).to eq(fuel_capacity)
      end
    end

    describe '#tank_full?' do
      it 'returns true when the tank is full' do
        @spacecraft.fuel_amount = fuel_capacity
        expect(@spacecraft.tank_full?).to be true
      end

      it 'returns false when the tank is not full' do
        expect(@spacecraft.tank_full?).to be false
      end
    end
  end

  context 'crew' do
    describe '#add_crew_members' do
      it 'allows to change the crew' do
        @spacecraft.add_crew_members('John', 'Jack')
        expect(@spacecraft.crew).to match_array(['John', 'Jack'])
      end
    end
  end

end