class UserInformation < ApplicationRecord
  belongs_to :information, optional: true
  belongs_to :user, optional: true
end
