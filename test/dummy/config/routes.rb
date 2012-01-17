# -*- encoding : utf-8 -*-
Rails.application.routes.draw do

  get "static/container"
  get "static/iframe"
  get "static/iframe_with_margin"
  root :to => "static#container"

  mount JqueryIframeAutoResize::Engine => "/jquery-iframe_auto_resize"
end

