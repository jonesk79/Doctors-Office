require 'pg'

class Patient

attr_reader :name, :birthday, :doctors_id


  def initialize(name, birthday, doctors_id)
    @name = name
    @birthday = birthday
    @doctors_id = doctors_id
  end

  def self.all
    results = DB.exec("SELECT * FROM patients;")
    patient = []
    results.each do |result|
      name = result['name']
      birthday = result['birthday']
      doctors_id = result['doctors_id'].to_i
      patient << Patient.new(name,birthday,doctors_id)
    end
    patient
  end

  def save
    results = DB.exec("INSERT INTO patients (name, birthday, doctors_id) VALUES ('#{@name}', '#{@birthday}', '#{@doctors_id}') RETURNING id;")
    @doctors_id = results.first['doctors_id'].to_i
  end

  def ==(another_patient)
    self.name ==another_patient.name
  end
end
