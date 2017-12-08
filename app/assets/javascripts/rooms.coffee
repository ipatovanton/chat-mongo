# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $messages = $('#messages')
  $messages.scrollTop $messages.prop('scrollHeight')
  $('#message_input').focus()



  # peer1 = new Peer(key: '743yuxnhyhczbyb9')
  # peer1.on 'open', (id) ->
  # console.log 'I\'m peer1 and my id is: ' + id
  # return

  # peer2 = new Peer(key: '743yuxnhyhczbyb9')
  # peer2.on 'open', (id) ->
  # console.log 'I\'m peer2 and my id is: ' + id
  # return


$(document).on 'keypress', '#message_input', (e) ->
  if e.keyCode == 13 and e.target.value
    chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
    App.room.speak(chatroom_id, e.target.value)
    e.target.value = ''
    e.preventDefault()
# $(document).on 'keypress', '#message_input', (e) ->
#  if e.target.value && e.keyCode == 13
#    chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
#    App.room.speak(e.target.value,chatroom_id)
#    e.target.value = ''
#    e.preventDefault()

# $(document).on "turbolinks:load", ->

#   $("#message_input").on "keypress", (e) ->
#     if e && e.keyCode == 13
#       e.preventDefault()
#       $(this).submit()

#   $("#message_input").on "submit", (e) ->
#     e.preventDefault()

#     chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
#     content        = $("#message_input")
#     App.room.speak(chatroom_id,content.val())
#     content.val("")
