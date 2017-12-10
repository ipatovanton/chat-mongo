$ ->
  $('#upload_attachment').on 'change', ->
    console.log('23234234')
  $('#fileupload').fileupload({
    dataType: 'json',
    autoUpload: false,
    add: (e, data) ->
      console.log(122342)
      data.context = $('<p/>').text('Uploading...').appendTo(document.body)
      data.submit()

    done: (event, data) ->
      result = data.result
      console.log(result)
      attachment_url = result.attachment_url
      console.log(attachment_url)
      chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
      App.room.speak(chatroom_id, attachment_url)
  })
