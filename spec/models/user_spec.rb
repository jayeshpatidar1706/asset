# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(
      name: "John Doe",
      email: "john.doe@example.com",
      role: "employee",
      password: "example123",
      age: 30
    )
    expect(user).to be_valid
  end

  it "is not valid with a name that is too short" do
    user = User.new(name: "A", email: "john.doe@example.com", role: "employee", age: 30)
    expect(user).to_not be_valid
  end

  it "is not valid with an invalid email format" do
    user = User.new(name: "John Doe", email: "invalid-email", role: "employee", age: 30)
    expect(user).to_not be_valid
  end

  it "is not valid with a negative age" do
    user = User.new(name: "John Doe", email: "john.doe@example.com", role: "employee", age: -5)
    expect(user).to_not be_valid
  end

  it "is not valid with an age that is not an integer" do
    user = User.new(name: "John Doe", email: "john.doe@example.com", role: "employee", age: 30.5)
    expect(user).to_not be_valid
  end
end