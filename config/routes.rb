Rails.application.routes.draw do
  use_doorkeeper
  root 'tests#index'
  devise_for :users
  get 'tests/index'

 # api
  get 'api/articles' => 'api#liste_article', as: :api_articles
  post 'api/article' => 'api#creer_article', as: :api_create_article
  get 'api/info/get' => 'api#get_client', as: :api_get_url
end
