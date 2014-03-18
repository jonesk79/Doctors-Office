require 'rspec'
require 'doctors'
require 'patient'
require 'pg'
require 'spec_helper'

DB = PG.connect({:dbname => 'test_database'})


describe 'patient' do
  it 'is initialized with a patients name' do
    patient = Patient.new('Alex Dinnel', '02-12-1992', 1)
    patient.should be_an_instance_of Patient
  end

  it 'tells you the Patients name' do
    patient = Patient.new('Alex Dinnel', '02-12-1992', 1)
    patient.name.should eq 'Alex Dinnel'
    patient.birthday.should eq '02-12-1992'
    patient.doctors_id.should eq 1
  end

  it 'starts off with no patients' do
    Patient.all.should eq []
  end

  it 'lets you save patient to the database' do
    patient = Patient.new('Alex Dinnel', '02-12-1992', 1)
    patient.name.should eq 'Alex Dinnel'
    patient.birthday.should eq '02-12-1992'
    patient.doctors_id.should eq 1
    patient.save
    Patient.all.should eq [patient]
  end

  it 'is the same patient if it has the same name' do
    patient1 = Patient.new('Alex Dinnel', '02-12-1992', 1)
    patient2 = Patient.new('Alex Dinnel', '02-12-1992', 1)
    patient1.should eq patient2
  end
end
