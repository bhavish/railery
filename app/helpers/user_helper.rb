module UserHelper
  
  # checks if the current user has screamed about the current event and then returns the appropiate 
  # tag in the user section
  def user_scream_check(audio)
    if current_user
      current_user.screams.each do |scream|
        if scream == audio
          return link_to "unscream" , unscream_user_path(current_user) , remote: true
        end
      end
      return link_to "scream" , scream_user_path(current_user) , remote: true
    else
      Rails.logger.debug { "The user is not logged in, error is throw" }
    end
  end
  
end
