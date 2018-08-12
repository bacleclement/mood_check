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
  #validates_presence_of :trust, :if => :trust?

  def current_step
    @current_step || steps.first
  end

  def situation?
    @current_step == "situation"
  end

  def about?
    @current_step == "about"
  end

  def thought?
    @current_step == "thought"
  end

  def emotion?
    @current_step == "emotion"
  end

  def emotion_level?
    @current_step == "emotion_level"
  end

  def physiological?
    @current_step == "physiological"
  end

  #def trust?
  #  @current_step == "trust"
  #end

  def progressbar
    [['situation', 'Étape 1'], ['about', 'Étape 2'], ['thought', 'Étape 3'], ['emotion', 'Étape 4'], ['emotion_level', 'Étape 5'], ['physiological', 'Étape 6']]
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

  def steps
    %w[situation about thought emotion emotion_level physiological] 
    # I delete trust step (last one step)
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


  def total(situation)
    maison ||= 0
    transports ||= 0
    travail ||= 0
    lit ||= 0
    magasin ||= 0
    vacances ||= 0
    sport ||= 0
    autre ||= 0
    total ||= 0
    # The purpose here is to count the number of thought check for each situation
    if situation == 'À la maison'
        maison += 1
      end

      if situation == 'Dans les transports'
        transports += 1
      end

      if situation == 'Au travail'
        travail += 1
      end

      if situation == 'Dans mon lit'
        lit += 1
      end

      if situation == 'Dans un magasin'
        magasin += 1
      end

      if situation == 'En vacances'
        vacances += 1
      end

      if situation == 'Au sport'
        sport += 1
      end

      if situation == 'Autre'
        autre += 1
      end

  end

  def maison(situation)
    if maison !
      maison << thought_check.situation
    end 
  end

end
