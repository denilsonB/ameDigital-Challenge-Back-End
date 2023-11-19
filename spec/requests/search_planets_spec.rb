require 'rails_helper'

RSpec.describe "Planets", type: :request do
  let!(:planet_1){FactoryBot.create(:planet,name: 'Tatooine')}
  let!(:planet_2){FactoryBot.create(:planet,name: 'Some random name')}

  context "seach by name " do 

    before do 
      get '/search', params: {search: "Tato"}
    end
  
    it "return planet" do
      expect(json[0]['name']).to eq('Tatooine')
    end
  
    it 'is valid with status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  context "search by id" do 
    before do 
      get '/search', params: {searchId: Planet.last.id}
    end

    it "return planet by id" do
      p json
      expect(json[0]['id']).to eq(Planet.last.id)
    end
  
    it 'is valid with status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
