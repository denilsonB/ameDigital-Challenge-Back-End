module PlanetServices
  class Create  < ApplicationService
      prepend SimpleCommand
      attr_reader :name, :weather, :ground

      def initialize(planet_params)
          @name = planet_params[:name]
          @weather = planet_params[:weather]
          @ground = planet_params[:ground]
      end

      def call 
          create_planet
      end
      
      private 

      def create_planet
          planet = Planet.new(
              name: @name,
              weather: @weather,
              ground: @ground
          )

          if !planet.save
              errors.add(:planet_error,planet.errors)
          else
              planet
          end
      end
  end
end