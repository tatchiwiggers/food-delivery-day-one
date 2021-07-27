require 'csv'
require_relative 'patient'

patients = []
csv_file = 'patients.csv'

# remember up to yesterday your headers were being implemented as an array?
# LIKE THIS: csv << ["name", "description", "rating", "prep_time", "done"]
# NOT TODAY!!!
# the first line consists of records, so we just convert these headers to symbols
# so that my headers will no longer be an array, it will be a hash


csv_options = { headers: :first_row, header_converters: :symbol }

# iterates over every record on the csv file
CSV.foreach(csv_file, csv_options) do |row|
  # p row[:id]

  # we have to convert row values because in the csv everyting is a string!!
  row[:id]    = row[:id].to_i          # Convert column to Integer
  row[:cured] = row[:cured] == "true"  # Convert column to boolean(true/false class)

  # p row.class
  # returns: <CSV::Row id:1 name:"paul" cured:true> => WE TREAT IT AS A HASH!

  # Patient.new(id: 3, name: "val", cured: false)
  # here we pass the row to the patient initializer and the attributes will get
  # fetched from the attributes hash
  patients << Patient.new(row)
end

p patients



# TODAY USE THIS TECHNIQUE AS WELL OK? MAKE SURE YOU USE IT ON THE EXERCISE!!


