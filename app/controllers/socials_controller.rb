class SocialsController < ApplicationController
  def like
    klass = params[:likable_type].constantize
  	@like = klass.find(params[:id])
  	current_user.toggle_like!(@like)
    @klass = "#"+klass.to_s+"_"+params[:id].to_s
  end 
end
