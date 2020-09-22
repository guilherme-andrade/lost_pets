class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params['id'])
  end

  # /pets/new
  def new
    # form_for(object) needs and object
    @pet = Pet.new
  end

  def edit
    @pet = Pet.find(params['id'])
  end  

  def destroy
    @pet = Pet.find(params['id'])

    @pet.destroy

    # This is a DELETE request, so it doesn't send HTML files back
    # We need to redirect the user.
    redirect_to pets_path
  end


  # POST /pets
  def create
    # initialized a pet, not saved yet.
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to @pet
    else
      # the pet will have errors, that we wanna show the user.´
      # if we redirect, we lose the errors.
      render :new
    end
  end

  def update
    @pet = Pet.find(params['id'])

    if @pet.update(pet_params)
      redirect_to @pet
    else
      # the pet will have errors, that we wanna show the user.´
      # if we redirect, we lose the errors.
      render :edit
    end    
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :address, :species, :found_on_date)
  end
end
