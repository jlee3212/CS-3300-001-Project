require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "ensures a password is present" do
    user = User.new(email: "test@gmail.com")
    expect(user.valid?).to eq(false)
  end
end
