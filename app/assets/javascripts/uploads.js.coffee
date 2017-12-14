$ ->
  $('#upload_attachment').on 'change', ->
    console.log('23234234')
  $('#fileupload').fileupload({
    dataType: 'json',
    autoUpload: false,
    add: (e, data) ->
      console.log(122342)
      data.submit()

    done: (event, data) ->
      result = data.result
      attachment_url = result.attachment_url
      url = "http://localhost:3000" + attachment_url
      chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
      App.room.speak(chatroom_id, url)

  })
