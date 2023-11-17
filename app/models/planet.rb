class Planet < ApplicationRecord
  include HTTParty

  before_create :set_number_of_appearances

  def set_number_of_appearances
    api_request = self.class.get("https://swapi.dev/api/planets/?search=#{self.name.downcase}")
    
    return 0 if api_request["results"].count == 0

    self.number_of_appearances = api_request["results"][0]["films"].try(:count)
  end
end
