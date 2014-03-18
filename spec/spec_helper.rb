require 'rspec'
require 'doctors'
require 'patient'
require 'pg'
require 'spec_helper'

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM doctors *;")
  end
end
