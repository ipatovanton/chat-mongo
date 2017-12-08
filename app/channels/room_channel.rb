# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatrooms.each do |chatroom|
      stream_from "chatrooms:#{chatroom.id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    p 'asdsad'
    @chatroom = Chatroom.find(data["chatroom_id"])
    p @chatroom
    p @chatroom
    message   = @chatroom.messages.create(content: data["content"], user: current_user)
    BroadcastMessageJob.perform_now message
  end
end
