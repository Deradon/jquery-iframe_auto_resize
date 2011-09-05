# broken if iframe is defined with margin
# broken in IE if frameborder is used

$ = jQuery
$.fn.iframeAutoResize = (spec) ->

  debug = (message) ->
    if options.debug == true && console && console.log
      console.log(message)
    else if options.debug == true
      alert(message)

  options = $.extend({
    interval: 0,
    minHeight: 0,
    maxHeight: 0,
    heightOffset: 0,
#    minWidth: 0,
#    maxWidth: 0,
#    widthOffset: 0,
    callback: (newHeight) -> {},
    debug: false
  }, spec);

  debug(options)

  resizeHeight = (iframe) ->
    $body = $(iframe).contents().find('body')
    if $body.length > 0
      newHeight = $body[0].offsetHeight + options.heightOffset
    else
      newHeight = options.heightOffset
    #newHeight = $body[0].clientHeight + options.heightOffset
    #newHeight = $body[0].scrollHeight + options.heightOffset
    #newHeight = $($body[0]).height() + options.heightOffset
    if (newHeight < options.minHeight)
      newHeight = options.minHeight + options.heightOffset;
    if (newHeight > options.maxHeight && options.maxHeight != 0)
      newHeight = options.maxHeight + options.heightOffset;
    iframe.style.height = newHeight + 'px';
    options.callback(newFrameHeight: newHeight)


  $(this).each ->
    iframe = this
    delayedResize = ->
      resizeHeight(iframe)

    source = $(this).attr('src')
    $(this).attr('src', '')

    $(this).load ->
      resizeHeight(this)

    $(this).attr('src', source)

    if options.interval != 0
      setInterval(delayedResize, options.interval)

