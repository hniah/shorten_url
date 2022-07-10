Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :shortener, only:[] do
        collection do
          post :encode
          get :decode
        end
      end
    end
  end
  get '/:slug', to: 'shorteners#show', as: :short
  root 'shorteners#home'
end
