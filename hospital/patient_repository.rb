require_relative 'patient'
require 'csv'

class PatientRepository
  def initialize(csv_file, room_repository)
    @room_repository = room_repository
    @csv_file = csv_file
    @patients = []
    @next_id = 1
    # we need to load the repo file when we initialize the repo
    # call load_csv method
    load_csv
  end

  def add_patient(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      p row
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean(true/false class)

      # here we need to fetch from the room repo the room instance
      # with the id row[:room_id] - we dont want the room id only
      # we want to SET the room for the patient.

      # so we need to have a method inside the room repo-  a find method that will
      # fetch that room id for us.

      # now i that have a room repo (dont forget to add it to the initializer!)
      # i can call my room repo find(id) method and grab that instance
      # of the room - and what do i wanna do with this instance?
      room = @room_repository.find(row[:room_id])

      @patients << Patient.new(row)

      # I want to assign it to the patient i am building using the info from my csv.
      patient.room = room
      @patients << room

      # everytime i read a record, the next id will be incremented
      # by 1 from the id i just read!
      @next_id = row[:id]
    end
    @next_id += 1
  end
end


repo = PatientRepository.new('patients.csv')

tatchi = Patient.new(name: 'tatchi')
justin = Patient.new(name: 'justin')
ju = Patient.new(name: 'ju')
yuhri = Patient.new(name: 'yuhri')

repo.add_patient(tatchi)
repo.add_patient(justin)
repo.add_patient(ju)
repo.add_patient(yuhri)

p repo

