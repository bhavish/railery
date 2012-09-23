class UserController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  # The initial dashboard that is displayed when the user logs into the system. In this all the audio
  # that the user likes
  # All the user follows
  # Also some popular stuff will be displayed to the user.
  # It will return the audio combination sorted in the order if the time.
  
  def dashboard  
    @audio = current_user.audios.all
  end
  
  # Audio liked by the user. so that this can be displayed as a seperate user deck system.
  # @PARAMS :audio_id
  # @PARAMS :current_user
  def user_screams
    #  Update the user for the current item he checks that he likes the item.
    #  Return JSON with ok if the updation is done succesfully else return a error status to the user.
    if current_user
      Rails.logger.debug { "The current loged in user is #{current_user.email}" }
      audio = Audio.find(params[:id])
      current_user.screams << audio
      render nothing: true , status: 200
    else
      render nothing: true , status: 400
    end
  end
  
  # Unlike the audio from the user.
  # @PARAMS :audio_id
  # @PARAMS :current_user
  def user_unscreams
    # Check if the current user is there if not present then throw back a json error to the user , if succesful the return a 
    # JSON back to the user to with ok for the server being updated else return a error status to the user. 
    if current_user
      Rails.logger.debug { "The current loged in user is #{current_user.email}" }
      audio = Audio.find(params[:id])
      current_user.screams.delete(audio)
      render nothing: true , status: 200
    else
      render nothing: true , status: 400
    end    
  end
  
  # follow the user that is present in the list
  def user_follows  
    if user_signed_in?
      Rails.logger.debug { "The user to be followed is #{params[:id]}" }
      user = User.find(id: params[:id])
      user.follows <<  current_user
    end
  end
  
  # unfollow any user that is present in the list
  def user_unfollows
    if user_signed_in?
      Rails.logger.debug { "The user to be unfollowed is #{params[:id]}" }
      user = User.find(id: params[:id])
      user.follows.delete(current_user)
    end
    
  end
  
  
  
end
