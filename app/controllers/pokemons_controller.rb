class PokemonsController < ApplicationController
  def index
    pokemon = Pokemon.all
    render json: pokemon.to_json( :include => [:abilities] )
  end

  def create
    pokemon = Pokemon.new(pokemon_params)
    if pokemon.save
      render json: pokemon.to_json( :include => [:abilities] )
    else
      render json: {
        error: "Cannot create",
        status: 500
      }, status: 500
    end
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :height)
  end
end
