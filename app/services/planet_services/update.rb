module PlanetServices
  class Update  < ApplicationService
      prepend SimpleCommand

      def initialize(id,params)
          @id = id
          @params = params
      end

      def call 
          update_planet
      end
      
      private 

      def update_planet
          planet = Planet.find(@id)

          if !planet.update(@params)
              errors.add(:planet_error,planet.errors)
          else
              planet
          end
      end
      
  end
end