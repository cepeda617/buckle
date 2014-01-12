Buckle::Engine.routes.draw do

  get '/css', to: 'style_guide#css'
  get '/components', to: 'style_guide#components'

  root 'style_guide#index'

end
