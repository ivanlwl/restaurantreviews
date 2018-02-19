require "rails_helper"

RSpec.describe Restaurant, type: :model do
  it "has a name" do # yep, you can totally use 'it'
    restaurant = Restaurant.create!(name: "My Awesome Idea Name") # creating a new idea 'instance'
    second_restaurant = Restaurant.create!(name: "My Second Idea Name") # creating another new idea 'instance'
    expect(second_restaurant.name).to eq("My Second Idea Name") # this is our expectation
  end
end
