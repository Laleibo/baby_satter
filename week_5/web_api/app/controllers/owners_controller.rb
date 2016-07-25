class OwnersController < ApplicationController

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(name: params[:name])
    # validation if statement
    @owner.save
    redirect_to @owner

  end

  def show
    @owner = Owner.find(params[:id])
    @pet = Pet.new
    @petinfo= Pet.scrape(@pet.animal,@pet.breed)
  end

end
