require 'rails_helper'

RSpec.describe "Planets", type: :request do
  let!(:planets){FactoryBot.create_list(:planet,5)}

  before do 
    get '/planets', params: {format: :json}
  end

  it "return all planets" do
    p json
    expect(json.size).to eq(5)
  end

  it 'is valid with status code 200' do
    expect(response).to have_http_status(:success)
  end
end
