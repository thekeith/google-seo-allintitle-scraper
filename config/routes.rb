Noko::Application.routes.draw do
  resources :projects do
  
    resources :keywords, except: [:edit, :update] do
      member do
        post :reset_allintitle
        post :get_allintitle
        post :switch_favorite
      end
      collection do
        get :excel_output
      end
    end
    resources :keyword_sets
  end
  
  get 'instructions', controller: :pages, to: :instructions
  
  root :to => 'projects#index'
end
