Spine = require('spine')

class Pad extends Spine.Controller
  constructor: ->
    super
    console.log this
    @padId = @doc.id
    @doc.bind 'change', @load
    @load()
  load: =>
    if @doc.pad? and @doc.pad != @padId
      @padId = @doc.pad
      @el.pad
        padId: @padId
        width: '100%'
        height: '100%'
        showLineNumbers: true
        userName: @name
        showChat: true
        useMonospaceFont: true
    
module.exports = Pad