Buckle::Engine.routes.draw do

  get '/css', to: 'style_guide#css'

  root 'style_guide#index'

end
