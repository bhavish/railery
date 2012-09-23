class Audio
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  
  mount_uploader :audio, AudiofileUploader
  
  belongs_to :user , class_name: "User" , inverse_of: :audios
  
  has_many :comments , class_name: "Comment", inverse_of: :audio_f
  
  belongs_to :user , class_name:  "User", inverse_of: :screams
  
  
end
