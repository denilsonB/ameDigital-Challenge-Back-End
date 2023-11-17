require 'rails_helper'

RSpec.describe Planet, type: :model do
  it 'is valid with valid attributes' do
    planet = FactoryBot.create(:planet)

    expect(planet).to be_valid
  end

  it 'is valid and appeared in 2 films' do
    planet = FactoryBot.create(:planet, name: 'Alderaan')

    expect(planet).to be_valid
    expect(planet.number_of_appearances).to eq(2)
  end
end
