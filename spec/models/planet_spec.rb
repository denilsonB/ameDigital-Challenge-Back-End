require 'rails_helper'

RSpec.describe Planet, type: :model do
  it 'is valid with valid attributes' do
    planet = FactoryBot.create(:planet)

    expect(planet).to be_valid
end
end
