Rails.application.routes.draw do

  get 'welcome/index'

  get 'pages/term'
  get 'pages/policy'
  get 'pages/about'

  root to: 'welcome#index'

  get 'visitors', to: 'visitors#index'
  get 'dashboard', to: 'user_dashboard#index'
  get 'about', to: 'pages#about'

  resources :votes
  resources :categories
  resources :comments
  resources :statuses
  resources :reactions
  resources :tasks
  resources :socials
  resources :addresses
  resources :contacts
  resources :skills
  resources :ranks
  resources :roles
  resources :information

  resources :wallets, only: [:create, :show, :index, :new]
  resources :courses do
    resources :comments, :controller => "course_comments", only: [:create]
    resources :articles, :controller => "course_articles", only: [:create]
    resources :reactions, :controller => "course_reactions", only: [:create]
  end
  resources :articles do
    resources :comments, :controller => "article_comments", only: [:create]
    resources :reactions, :controller => "article_reactions", only: [:create]
  end
  resources :projects do
    resources :tasks, :controller => "project_tasks", only: [:create]
    resources :comments, :controller => "project_comments", only: [:create]
    resources :votes, :controller => "project_votes", only: [:create]
    resources :reactions, :controller => "project_reactions", only: [:create]
  end

  devise_for :users, controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
  }
  resources :users
  post 'transaction', to: 'transaction#create'
  get 'transaction', to: 'transaction#index'
  post 'invest', to: 'transaction#invest'
  post 'divest', to: 'transaction#devest'
end
