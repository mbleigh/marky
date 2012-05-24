Spine = require('spine')
marked = require('lib/marked')

class Doc extends Spine.Model
  @configure 'Doc', 'pad', 'content'
  constructor: ->
    super

  html: =>
    marked(@content)

  textUrl: =>
    "http://beta.etherpad.org/p/#{@pad}/export/txt"

  updateContent: =>
    if @pad?
      $.get @textUrl(), (content)=>
        @content = content
        @save()
    else
      console.log "No ID set, not updating.", @
  
module.exports = Doc