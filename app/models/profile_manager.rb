class ProfileManager < ApplicationRecord
  belongs_to :social, optional: true
  belongs_to :address, optional: true
  belongs_to :user, optional: true
  belongs_to :contact, optional: true
  belongs_to :rank, optional: true
  belongs_to :skill, optional: true
end
