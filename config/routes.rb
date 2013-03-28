Refinery::Core::Engine.routes.append do

  # Admin routes
  namespace :blocks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :blocks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
