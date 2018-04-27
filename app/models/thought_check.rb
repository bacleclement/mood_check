class ThoughtCheck < ApplicationRecord
  belongs_to :profile
  has_many :tasks
  has_many :question
end
