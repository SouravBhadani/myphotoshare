class PrettylinksController < ApplicationController
  before_action :set_prettylink, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @prettylinks = Prettylink.all
    respond_with(@prettylinks)
  end

  def show
    respond_with(@prettylink)
  end

  def new
    @prettylink = current_user.prettylinks.build
    respond_with(@prettylink)
  end

  def edit
  end

  def create
    @prettylink = current_user.prettylinks.build(prettylink_params)
    @prettylink.save
    respond_with(@prettylink)
  end

  def update
    @prettylink.update(prettylink_params)
    respond_with(@prettylink)
  end

  def destroy
    @prettylink.destroy
    respond_with(@prettylink)
  end

  private
    def set_prettylink
      @prettylink = Prettylink.find(params[:id])
    end

    def prettylink_params
      params.require(:prettylink).permit(:url, :title, :image, :user_id)
    end
end
