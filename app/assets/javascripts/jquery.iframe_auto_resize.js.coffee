# broken if iframe is defined with margin
# broken in IE if frameborder is used

$ = jQuery
$.fn.iframeAutoResize = (spec) ->

  debug = (message) ->
    if options.debug == true && console && console.log
      console.log(message)
    else if options.debug == true
      alert(message)

  oldHeight = 0

  options = $.extend({
    interval: 0,

    minHeight: 0,
    maxHeight: 0,
    heightOffset: 0,

    animationSpeed: 500,    #in px / s
    maxAnimationTime: 1000, #in ms
#    minWidth: 0,
#    maxWidth: 0,
#    widthOffset: 0,
    callback: (newHeight) -> {},
    debug: false
  }, spec);
  debug(options)


  animateIframe = (iframe, newHeight) ->
    #iframe.style.height = newHeight + 'px';
    difference = newHeight - oldHeight
    time = options.maxAnimationTime
    if options.animationSpeed != 0
      time = Math.abs(difference) / options.animationSpeed * 1000
    time = options.maxAnimationTime if time > options.maxAnimationTime
    $(iframe).stop().animate({'height': newHeight},time, 'linear')

#  shrinkIframe = (iframe, newHeight, difference) ->
#    time = options.maxAnimationTime
#    if options.shrinkSpeed != 0
#      time = Math.abs(difference) / options.shrinkSpeed * 1000
#    time = options.maxAnimationTime if time > options.maxAnimationTime

#    if options.shrinkDelay > 0
#      $(iframe).delay(options.shrinkDelay).stop().animate({'height': newHeight},time, 'linear')
#    else
#      $(iframe).stop().animate({'height': newHeight},time, 'linear')


#  expandIframe = (iframe, newHeight, difference) ->
#    time = options.maxAnimationTime
#    if options.expandSpeed != 0
#      time = Math.abs(difference) / options.expandSpeed * 1000
#    time = options.maxAnimationTime if time > options.maxAnimationTime
#    $(iframe).stop().animate({'height': newHeight},time, 'linear')



  computeHeight = (body) ->
    if body.length > 0
      newHeight = body[0].offsetHeight + options.heightOffset
    else
      newHeight = options.heightOffset
    #newHeight = $body[0].clientHeight + options.heightOffset
    #newHeight = $body[0].scrollHeight + options.heightOffset
    #newHeight = $($body[0]).height() + options.heightOffset
    if (newHeight < options.minHeight)
      newHeight = options.minHeight + options.heightOffset;
    if (newHeight > options.maxHeight && options.maxHeight != 0)
      newHeight = options.maxHeight + options.heightOffset;
    return newHeight


  resizeHeight = (iframe) ->
    $body = $(iframe).contents().find('body')
    newHeight = computeHeight($body)

    if newHeight != oldHeight
      animateIframe(iframe, newHeight)
      oldHeight = newHeight


  init = () =>
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

  init()

