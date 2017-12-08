App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(1232324234)
    # Called when there's incoming data on the websocket for this channel
    console.log(data.chatroom_id.$oid)
    messages = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id.$oid}']")
    messages.append("
      <div class='message'>
        <a href='' class='message_profile-pic'></a>
        <a href='' class='message_username'>#{data.email}</a>
        <span class='message_timestamp'>

        </span>
        <span class='message_star'></span>
        <span class='message_content'>
          #{data.content}
        </span>
      </div>")
    console.log(messages)
    messages.scrollTop messages.prop('scrollHeight')

  speak: (chatroom_id,message) ->
    @perform 'speak', {chatroom_id: chatroom_id, content: message}
