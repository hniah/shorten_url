Rails.application.routes.draw do
  namespace :api do
    resource :shortener, only:[] do
      collection do 
        post :encode 
        post :decode
      end
    end
  end
  get '/:slug', to: 'shorteners#show', as: :short
end
