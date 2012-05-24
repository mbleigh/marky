Spine = require('spine')

class Preview extends Spine.Controller
  constructor: ->
    super
    @doc.bind 'change', @update
    @startRefresh()

  startRefresh: =>
    clearInterval @interval if @interval?
    @interval = setInterval @doc.updateContent, 2000

  update: =>
    @html @doc.html()
  
module.exports = Preview