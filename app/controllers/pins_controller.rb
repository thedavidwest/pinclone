class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_user, only: [:edit, :update, :destroy]
  before_action :set_pin, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @pins = Pin.all
  end
  def show
  end
  def new
    @pin = current_user.pins.build
  end
  def edit
  end
  def create
    @pin = current_user.pins.build(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update


    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Pin was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description, :image, :title, :name)
    end
end
