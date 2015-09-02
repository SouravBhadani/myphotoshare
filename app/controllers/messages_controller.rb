class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html ,:js

  def index
    @message = current_user.messages.build
    @messages = Message.all
    respond_with(@messages)
  end

  def show
    respond_with(@message)
  end

  def new
    @message = current_user.messages.build
    respond_with(@message)
  end

  def edit
  end

  def create
    @message = current_user.messages.build(message_params)
    @message.save
    messgae = {id: @message.id,content: @message.body,user_id: @message.user_id ,created_at: @message.created_at.try(:strftime,"%b %d, %Y"),user_name:  @message.user.fullname }
    $redis.publish('messages',messgae.to_json)
   # PrivatePub.publish_to("/messages/new", message: @message)
    respond_with(@message)
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:user_id, :body)
    end
end
