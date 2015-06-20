Rails.application.routes.draw do

  devise_for :users

  resources :questions

  resources :topics do
    resources :posts, except: [:index] do
      resources :summaries, except: [:index, :edit]
    end
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
