require 'rails_helper'

RSpec.describe "Planets", type: :request do
  before do 
    post '/planets', params: {
      name: 'Tatooine',
      weather: 'Weather 1',
      ground: 'Ground 1'}
  end

  it 'is valid with status code 200' do
    expect(response).to have_http_status(:success)
  end

  it "returns the name" do
    expect(json['name']).to eq('Tatooine')
  end

  it "returns the weather" do
    expect(json['weather']).to eq('Weather 1')
  end

  it "returns the ground" do
    expect(json['ground']).to eq('Ground 1')
  end

  it "returns the number of appareances" do
    expect(json['number_of_appearances']).to eq(5)
  end
end
