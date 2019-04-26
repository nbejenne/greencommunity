require 'rspec'

class Hotel
  attr_accessor :guests

  def initialize
    @guests = []
    @room_available = false
  end

  def check_in_guest(guest_name, room_available)
    @guests << guest_name

  end

  def check_out_guest(guest_name)
    @guests.delete(guest_name)
  end
end

describe Hotel do
  it 'can check a guest in' do
    hotel = Hotel.new
    hotel.check_in_guest('George Harrison')
    expect(hotel.guests).to include 'George Harrison'
  end

  it 'can check a guest out' do
    # Put your own test here
    hotel = Hotel.new
    hotel.check_in_guest('George Harrison')
    hotel.check_out_guest('George Harrison')
    expect(hotel.guests).to include 'George Harrison'
  end

  context 'room is available'
  it 'refuse check-in if no more rooms' do
    hotel = Hotel.new
    expect(hotel.check_in_guest).to be false
  end
end
