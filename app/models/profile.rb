class Profile < ApplicationRecord
  belongs_to :user
  has_many :thought_checks
end
