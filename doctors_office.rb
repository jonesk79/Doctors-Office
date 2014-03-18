require 'pg'
require './lib/doctors'
require './lib/patient'

DB = PG.connect({:dbname => 'doctors'})

def main_menu
  puts "Welcome To The Doctors Office."
  "\n"
  puts "Press 'a' to add new doctor."
  puts "Press 'p' to add new patient."
  puts "Press 'l' to list."
  puts "Press 'x' to exit."
  main_choice = gets.chomp
  if main_choice == 'a'
    add_doctor
  elsif main_choice == 'p'
    add_patient
  elsif main_choice == 'l'
    list_doctors
  elsif main_choice == 'x'
    exit
  else
    puts "Sorry, that wasn't a valid option! :("
    main_menu
  end
end

def list_doctors
  puts "Here is a list of doctors and their specialty"
  results = DB.exec("SELECT * FROM doctors")
  results.each do |result|
  puts "\t" + result["name"]
  main_menu
  end
end

def add_doctor
  puts "Enter the Doctors name you would like to add:"
  doctors_name = gets.chomp
  puts "\n"

  puts "Enter the specialty of the Doctor:"
  specialty = gets.chomp
  new_doctor = Doctors.new(doctors_name, specialty)
  new_doctor.save
  puts "Doctor added"
  puts "\n"
  main_menu
end

def add_patient
  puts "Enter the Patient name you would like to add:"
  patient_name = gets.chomp
  puts "\n"

  puts "Enter the Patient birth date:"
  patient_birthday = gets.chomp
  new_patient = Patient.new(patient_name, birthday)
  new_patient.save
  puts "Patient added."
  puts "\n"
  main_menu
end
main_menu



