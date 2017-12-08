class ChatroomUser
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include Mongoid::Paperclip

  field :chatroom_id, type: Integer
  field :user_id, type: Integer
  field :last_read_at, type: Time

  belongs_to :chatroom
  belongs_to :user

  before_create :set_last_read

  def set_last_read
    self.last_read_at = Time.zone.now
  end


end
