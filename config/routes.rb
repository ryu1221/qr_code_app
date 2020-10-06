Rails.application.routes.draw do

  resources :top, only:['index', 'show', 'create'] do
    # collection do
    #   get 'file'
    #   post 'file' => 'top#file_create'
    #   get 'wifi'
    #   post 'wifi' => 'top#wifi_create'
    # end
    # member do
    #   get 'file_show'
    #   get 'wifi_show'
    # end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
