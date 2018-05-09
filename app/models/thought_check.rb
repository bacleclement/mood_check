class ThoughtCheck < ApplicationRecord
  attr_writer :current_step
  attr_accessor :situation, :thought, :emotion, :emotion_level, :about, :physiological, :trust

  belongs_to :profile
  has_many :tasks
  has_many :question

  validates :thought, presence: true

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[situation about thought emotion emotion_level physiological trust]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    if current_step == steps.first
      return true
    else
      return false
    end
  end

  def last_step?
    current_step == steps.last
  end
end
