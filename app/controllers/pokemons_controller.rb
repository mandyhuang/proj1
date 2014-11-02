class PokemonsController < ApplicationController

  def new
  end

  def create
    @poke = Pokemon.new(pokemon_params)
    @poke.update_attributes(:level => 1, :trainer_id => current_trainer.id, :health => 100)
    saved = @poke.save
    if saved
      redirect_to trainer_path(@current_trainer.id)
    else
      flash[:error] = @poke.errors.full_messages.to_sentence
      render new_path
    end
  end

  def capture
  	@poke = Pokemon.find(params[:id])
  	@poke.update_attributes(:trainer_id => current_trainer.id)
  	#1/0
  	redirect_to root_path
  end

  def damage
    @poke = Pokemon.find(params[:id])
    @poke.update_attributes(:health => @poke.health-10)
    if @poke.health <= 0
    	@poke.destroy
    end
    #1/0
    redirect_to trainer_path(@poke.trainer_id)
  end

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end