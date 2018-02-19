require "rails_helper"

RSpec.describe Restaurant, type: :model do
  describe '#name' do

    it 'should validate presence' do
      record = Restaurant.new
      record.name = '' # invalid state
      record.price = '' # invalid state
      record.valid? # run validations
      record.errors[:name].should include("can't be blank") # check for presence of error
      record.errors[:price].should include("can't be blank") # check for presence of error

      record.name = 'foo@bar.com' # valid state
      record.price = 'foo@bar.com' # valid state
      record.valid? # run validations
      record.errors[:name].should_not include("can't be blank") # check for absence of error
      record.errors[:price].should_not include("can't be blank") # check for absence of error
    end

  end
end
