class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    p '============'
    p '============'
    p '============'
    p '============'
    p message
    ActionCable.server.broadcast "chatrooms:#{message.chatroom_id}", {
      email: message.user.email,
      content: message.content,
      chatroom_id: message.chatroom.id
    }

  end
end
