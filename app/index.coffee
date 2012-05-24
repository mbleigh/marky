require('lib/setup')

Spine = require('spine')
Doc = require('models/doc')
Pad = require('controllers/pad')
Preview = require('controllers/preview')
marked = require('lib/marked')

class App extends Spine.Controller
  events:
    'click #pad_name': 'choosePad'

  constructor: ->
    super
    @routes
      "/p/:pad": (params)=>
        @doc.pad = params.pad
        @doc.save()
    @doc = Doc.create()
    @pad = new Pad(el: $('#pad'), doc: @doc, name: @getName())
    @preview = new Preview(el: $('#preview'), doc: @doc)

    @doc.bind 'change', @render
    Spine.Route.setup()
    @choosePad() if window.location.hash == ''

  getName: ->
    localStorage['user'] || localStorage['user'] = prompt("What is your name?")

  render: =>
    $('#pad_name').text(@doc.pad)
    $('title').text("#{@doc.pad} - Marky (Collaborative Markdown)")

  choosePad: =>
    @doc.pad = prompt("Enter the name of the pad you'd like to open.")
    @doc.save()
module.exports = App
    