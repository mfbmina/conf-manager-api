Rails.application.routes.draw do
  %w( 404 422 500 ).each do |code|
    get code, controller: :application, action: :error, code: code
  end

  root 'welcome#index'
end
