require 'dockingstation'

describe DockingStation do

    subject(:station) {described_class.new}
    bike = Bike.new

    it { is_expected.to respond_to(:release_bike) }

    it "1. should release a working bike" do
        station.dock(bike)
        expect(station.release_bike.working?).to eq true  
    end

    it '2. should dock a bike' do
        expect(station.dock(bike)).to eq bike
    end    

    it '3. should return the docked bike when asked' do
        station.dock(bike) 
        expect(station.bikes.last).to eq bike 
    end
    
    describe '#release_bike' do

        it '4. should not release a bike if empty' do 
            #no clue as to why we need these curly brackets?
            expect { station.release_bike }.to raise_error("Station is empty!")
        end
    end

    describe '#dock' do 
        it '5. should not dock a bike if there is more than capacity' do
            DockingStation::DEFAULT_CAPACITY.times{ station.dock Bike.new }
            expect{ station.dock(bike) }.to raise_error("Station is full")
        end
    end

    describe '#initialize' do
        it '6. should take the argument passed and use it as the capacity' do
            test_station = DockingStation.new(5)
            expect(test_station.capacity).to eq 5
        end

        it '7. should set a default capacity when no arguments are passed' do
            expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
        end
    end

end