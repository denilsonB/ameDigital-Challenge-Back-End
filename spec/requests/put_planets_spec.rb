require 'rails_helper'

RSpec.describe "Planets", type: :request do
    let!(:planet) {FactoryBot.create(:planet)}

    context "Updating Planet information " do
        before do
            put "/planets/#{planet.id}", params: {
                    name: "updated name",
                    weather: "updated weather",
                    ground: "updated ground"
                
            }
        end
        it "is valid with status code 200" do
            p json
            expect(response.status).to eq(200)
        end
        
        it "updated the name" do
            expect(json["name"]).to eq("updated name")
        end
        
        it "updated the weather" do
            expect(json["weather"]).to eq("updated weather")
        end
        
        it "updated the ground" do
            expect(json["ground"]).to eq("updated ground")
        end
    end
end
