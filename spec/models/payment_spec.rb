require 'rails_helper'

RSpec.describe Payment, type: :model do
  it 'is valid with a name, amount, and a user' do
    user = User.create(email: 'tamara@gmail.com', password: '123456') # Create a user for author_id
    payment = Payment.new(name: 'test spending', amount: 10.50, author: user)
    expect(payment).to be_valid
  end

  it 'is invalid without a name' do
    payment = Payment.new(name: nil, amount: 10.50, author: User.new)
    expect(payment).to_not be_valid
  end

  it 'is invalid without an amount' do
    payment = Payment.new(name: 'test spending', amount: nil, author: User.new)
    expect(payment).to_not be_valid
  end
end
