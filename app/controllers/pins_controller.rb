class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    
    @pins = Pin.all.order("created_at DESC")
                   .paginate(:page => params[:page], :per_page => 9)
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
       redirect_to @pin , notice: "Pin was successfully created"
    else
      render action: 'new'
    end  
  end

  def update
    @pin.update(pin_params)
    if  @pin.update(pin_params)
        redirect_to @pin , notice: "Pin was successfully created"
    else
      render action: 'edit'
    end  
  end

  def destroy
    @pin.destroy
     redirect_to pins_path
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:descrption,:image)
    end
end

  def correct_user
    @pin =current_user.pins.find(params[:id])
  end  