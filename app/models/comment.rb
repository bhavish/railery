class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment_field
  belongs_to :audio_f , class_name: "Audio", inverse_of: :comments
  
end
