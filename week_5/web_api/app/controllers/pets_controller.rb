class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @owner = Owner.find(params[:owner_id])
    # @pet = @owner.pets.create(pet_params)
    @pet =  @owner.pets.create!({name: params[:name], animal: params[:animal], breed: params[:breed] })
    redirect_to owner_path(@owner)
  end

  def show
    @pet = Pet.find(params[:id])
    @owner = Owner.find(params[:owner_id])
    @petinfo= Pet.scrape(@pet.animal,@pet.breed)
    @catinfo = Pet.scrape(@pet.animal,@pet.breed)
  end

end
