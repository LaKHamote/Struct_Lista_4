Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      scope 'teachers' do
        get '/', to: 'teachers#index'
        get 'show/:id', to: 'teachers#show'
        post 'create', to: 'teachers#create'
        patch 'update/:id', to: 'teachers#update'
        delete 'delete/:id', to: 'teachers#delete'
        get 'my_students/:id', to: 'teachers#my_students'

      end
    end
  end

end