Buckle::Engine.routes.draw do

  get '/css', to: 'style_guide#css'

  root to: 'style_guide#index'

end
