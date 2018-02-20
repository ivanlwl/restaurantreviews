class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
      @restaurant = Restaurant.new(restaurant_params)

      respond_to do |format|
        if @restaurant.save
          format.html { redirect_to @restaurant, notice: 'Idea was successfully created.' }
          format.json { render :show, status: :created, location: @restaurant }
        else
          format.html { render :new }
          format.json { render json: @restaurant.errors, status: :unprocessable_entity }
        end
      end
    end

  def update
    @restaurant = Restaurant.find(params[:id])
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :price)
  end
end
