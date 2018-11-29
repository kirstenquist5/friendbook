class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :destroy]
  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to person_path(@person.id)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @person.destroy
    redirect_to root_path
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :avatar, :email, :phone)
  end
end