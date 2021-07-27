require_relative 'patient'

class Room
  attr_accessor :id

  # class CapacityReachedError < Exception; end

  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 0
    # array of patient instances
    @patients = attributes[:patients] || []
  end

  def full?
    @patients.size == @capacity
  end

  def add_patient(patient)
    # raise StandardError, "You can't add any more patients, room is full!" if full?
    raise CapacityReachedError, "You can't add any more patients, room is full!" if full?
    @patients << patient
    patient.room = self
  end
end


room_1 = Room.new(capacity: 2)
# p room_1

john = Patient.new(name: 'John')
room_1.add_patient(john)
p room_1

# TODO: find out which room the patient is in
# for that we need to store the room inside the patient!
# Step 1: add room accessor to patient
# Step 2: add patient.room = self inside add_patient class
p john.room


yuhri = Patient.new(name: 'yuhri')
room_1.add_patient(mari)

begin
  ju = Patient.new(name: 'ju')
  room_1.add_patient(ju)
rescue Room::CapacityReachedError
  puts "--- we will not add #{ju.name}, rooms are full ---"
end

p room_1


