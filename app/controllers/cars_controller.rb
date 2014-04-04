class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy, :claim]
  def index
    @cars = Car.where(user_id: nil)
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car, notice: "#{@car.year} #{@car.make} #{@car.model} created."
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: "Car was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_url, notice: "#{@car.year} #{@car.make} #{@car.model} was removed."
  end

  def show
  end

  def claim
    @car.user = current_user
    if @car.save
      redirect_to root_path, notice:
          "#{@car.make} #{@car.model} has been moved to your inventory"
    else
      redirect_to root_path, error: "Unable to claim car"
    end
  end

  def my_cars
    @cars = Car.where(user: current_user)
    render action: 'index'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end

end
