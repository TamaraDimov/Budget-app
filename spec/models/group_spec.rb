# spec/models/group_spec.rb

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:group) { described_class.new(name: 'Test Group', user:) }

  it 'is valid with valid attributes' do
    group.icon.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_icon.png')), filename: 'test_icon.png',
                      content_type: 'image/png')
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group.name = nil
    expect(group).not_to be_valid
  end

  it 'is not valid without an icon' do
    group.icon = nil
    expect(group).not_to be_valid
  end

  it 'has many payment_items' do
    expect(group.payment_items).to be_empty
  end
end
