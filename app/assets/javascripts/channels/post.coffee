App.post = App.cable.subscriptions.create "PostChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data.action == "new_post"
        $("#posts .data").prepend(data.message)
  echo: ()->
    @perform "echo", {hola: "mundo"}