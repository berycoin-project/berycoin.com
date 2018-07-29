class User < ApplicationRecord

  has_many :user_information
  has_many :information, through: :user_information, dependent: :destroy

  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy

  has_many :user_wallets
  has_many :wallets, through: :user_wallets, dependent: :destroy

  has_many :user_wallets
  has_many :vests, through: :user_wallets, dependent: :destroy

  has_many :profile_managers
  has_many :addresses, through: :profile_managers, dependent: :destroy

  has_many :profile_managers
  has_many :ranks, through: :profile_managers

  has_many :profile_managers
  has_many :socials, through: :profile_managers, dependent: :destroy

  has_many :profile_managers
  has_many :skills, through: :profile_managers, dependent: :destroy

  has_many :profile_managers
  has_many :contacts, through: :profile_managers, dependent: :destroy

  has_many :user_projects
  has_many :projects, through: :user_projects, dependent: :destroy

  has_many :project_tasks
  has_many :tasks, through: :project_tasks, dependent: :destroy

  has_many :project_votes
  has_many :votes, through: :project_votes, dependent: :destroy

  has_many :status_managers
  has_many :statuses, through: :status_managers, dependent: :destroy

  has_many :user_courses
  has_many :courses, through: :user_courses, dependent: :destroy

  has_many :article_managers
  has_many :articles, through: :article_managers, dependent: :destroy

  has_many :comment_managers
  has_many :comments, through: :comment_managers, dependent: :destroy

  has_many :category_managers
  has_many :categories, through: :category_managers, dependent: :destroy

  has_many :reaction_managers
  has_many :reactions, through: :reaction_managers, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
