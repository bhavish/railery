class AudiosController < ApplicationController
  before_filter :authenticate_user!
  respond_to :js
  
  def create
    if user_signed_in?
    @audio = Audio.new(params[:audio])
    if @audio.save
      current_user.audios << @audio
      current_user.save
      respond_to do |format|
        format.js
      end
    else
      
    end
  else
    Rails.logger.debug { "The user is not signed in" }
  end
  end
  
end
