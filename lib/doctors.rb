require 'pg'

class Doctors

attr_reader :name, :specialty, :id

  def initialize(name, specialty, id=nil)
    @name = name
    @specialty =specialty
    @id = id
  end

  def self.all
    results = DB.exec("SELECT * FROM doctors;")
     doctors = []
    results.each do |result|
      name = result['name']
      specialty = result['specialty']
      id = result['id'].to_i
      doctors << Doctors.new(name, specialty, id)
    end
    doctors
  end

  def save
   results = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_doctors)
    self.name == another_doctors.name
  end
end
