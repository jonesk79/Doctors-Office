require 'rspec'
require 'doctors'
require 'patient'
require 'pg'
require 'spec_helper'

DB = PG.connect({:dbname => 'test_database'})


describe 'doctors' do
  it 'is initialized with a doctors name' do
    doctors = Doctors.new('Jack Turn', 'radiologist', 1)
    doctors.should be_an_instance_of Doctors
  end

  it 'tells you the Doctors name' do
    doctors = Doctors.new('Jack Turner', 'radiologist', 1)
    doctors.name.should eq 'Jack Turner'
    doctors.specialty.should eq 'radiologist'
    doctors.id.should eq 1
  end

  it 'starts off with no doctors' do
    Doctors.all.should eq []
  end

  it 'lets you save doctors to the database' do
    doctors = Doctors.new('Jack Turner', 'radiologist', 1)
    doctors.name.should eq 'Jack Turner'
    doctors.specialty.should eq 'radiologist'
    doctors.id.should eq 1
    doctors.save
    Doctors.all.should eq [doctors]
  end

  it 'is the same doctor if it has the same name' do
    doctor1 = Doctors.new('Jack Turner', 'radiologist', 1)
    doctor2 = Doctors.new('Jack Turner', 'radiologist', 1)
    doctor1.should eq doctor2
  end
end


