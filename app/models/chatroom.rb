class Chatroom
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include Mongoid::Paperclip

  field :name, type: String

  has_many :chatroom_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  scope :public_channels, ->{ where(direct_message: false) }
  scope :direct_messages, ->{ where(direct_message: true) }
  def self.direct_message_for_users(users)
    user_ids = users.map(&:id).sort
    name = "DM:#{user_ids.join(":")}"

    if chatroom = direct_messages.where(name: name).first
      chatroom
    else
      # create a new chatroom
      chatroom = new(name: name, direct_message: true)
      chatroom.save
      chatroom
    end
  end

  def Users
    User.in(id: chatroom_users.pluck(:user_id))
  end
end
