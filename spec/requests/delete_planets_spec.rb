require 'rails_helper'

RSpec.describe 'Planets', type: :request do
    describe "DELETE /destroy" do
        let!(:planet) {FactoryBot.create(:planet)}

        before do
            delete "/planets/#{planet.id}", params: {format: :json}
        end

        it "returns status code 200" do
            expect(response).to have_http_status(200)
        end
    end
end