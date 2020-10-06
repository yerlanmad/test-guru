Rails.application.routes.draw do
  get 'about/index'

  get 'about', to: 'about#index'

  get 'about/author'

end
