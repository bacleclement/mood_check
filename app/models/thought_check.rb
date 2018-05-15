class ThoughtCheck < ApplicationRecord
  attr_writer :current_step

  belongs_to :profile
  has_many :tasks
  has_many :question

  validates_presence_of :situation, :if => :situation?
  validates_presence_of :about, :if => :about?
  validates_presence_of :thought, :if => :thought?
  validates_presence_of :emotion, :if => :emotion?
  validates_presence_of :emotion_level, :if => :emotion_level?
  validates_presence_of :physiological, :if => :physiological?
  validates_presence_of :trust, :if => :trust?

  def current_step
    @current_step || steps.first
  end

  def situation?
    @current_step == "situation"
  end

  def trust?
    @current_step == "trust"
  end

  def thought?
    @current_step == "thought"
  end

  def trust?
    @current_step == "trust"
  end

  def emotion?
    @current_step == "emotion"
  end

  def emotion_level?
    @current_step == "emotion_level"
  end

  def trust?
    @current_step == "trust"
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
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
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end
end
