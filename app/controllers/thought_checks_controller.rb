class ThoughtChecksController < ApplicationController

  # before_action :set_thought_check, :only [ :show, :edit, :update, :destroy ]
  # I didn't understand why this line of code break my app ?

  def index
    @thought_checks = ThoughtCheck.all.where(profile_id: Profile.find_by_id(current_user.id))

    @thought_checks.each do |thought_check|
      #thought_check.total(thought_check.situation)
      @maison ||= 0
      @emotion_maison ||= []
      @emotion_maison_peur ||= []
      @emotion_maison_colere ||= []
      @emotion_maison_tristesse ||= []
      @emotion_maison_culpa ||= []
      @emotion_maison_haine ||= []
      @emotion_maison_frustra ||= []

      @transports ||= 0
      @emotion_transports ||= []
      @emotion_transports_peur ||= []
      @emotion_transports_colere ||= []
      @emotion_transports_tristesse ||= []
      @emotion_transports_culpa ||= []
      @emotion_transports_haine ||= []
      @emotion_transports_frustra ||= []

      @travail ||= 0
      @emotion_travail ||= []
      @emotion_travail_peur ||= []
      @emotion_travail_colere ||= []
      @emotion_travail_tristesse ||= []
      @emotion_travail_culpa ||= []
      @emotion_travail_haine ||= []
      @emotion_travail_frustra ||= []

      @lit ||= 0
      @emotion_lit ||= []
      @emotion_lit_peur ||= []
      @emotion_lit_colere ||= []
      @emotion_lit_tristesse ||= []
      @emotion_lit_culpa ||= []
      @emotion_lit_haine ||= []
      @emotion_lit_frustra ||= []

      @magasin ||= 0
      @emotion_magasin ||= []
      @emotion_magasin_peur ||= []
      @emotion_magasin_colere ||= []
      @emotion_magasin_tristesse ||= []
      @emotion_magasin_culpa ||= []
      @emotion_magasin_haine ||= []
      @emotion_magasin_frustra ||= []

      @vacances ||= 0
      @emotion_vacances ||= []
      @emotion_vacances_peur ||= []
      @emotion_vacances_colere ||= []
      @emotion_vacances_tristesse ||= []
      @emotion_vacances_culpa ||= []
      @emotion_vacances_haine ||= []
      @emotion_vacances_frustra ||= []

      @sport ||= 0
      @emotion_sport ||= []
      @emotion_sport_peur ||= []
      @emotion_sport_colere ||= []
      @emotion_sport_tristesse ||= []
      @emotion_sport_culpa ||= []
      @emotion_sport_haine ||= []
      @emotion_sport_frustra ||= []

      @autre ||= 0
      @emotion_autre ||= []
      @emotion_autre_peur ||= []
      @emotion_autre_colere ||= []
      @emotion_autre_tristesse ||= []
      @emotion_autre_culpa ||= []
      @emotion_autre_haine ||= []
      @emotion_autre_frustra ||= []

      #@total ||= 0
      if thought_check.situation == 'À la maison'
        @maison +=1
        @emotion_maison << thought_check.emotion
        if thought_check.emotion == 'Peur'
          @emotion_maison_peur << thought_check.emotion
        elsif thought_check.emotion == 'Colère'
          @emotion_maison_colere << thought_check.emotion
        elsif thought_check.emotion == 'Tristesse'
          @emotion_maison_tristesse << thought_check.emotion
        elsif thought_check.emotion == 'Culpabilité'
          @emotion_maison_culpa << thought_check.emotion
        elsif thought_check.emotion == 'Haine'
          @emotion_maison_haine << thought_check.emotion
        else thought_check.emotion == 'Frustration'
          @emotion_maison_frustra << thought_check.emotion
        end
      end
      if thought_check.situation == 'Dans les transports'
        @transports +=1
        @emotion_transports << thought_check.emotion
        if thought_check.emotion == 'Peur'
          @emotion_transports_peur << thought_check.emotion
        elsif thought_check.emotion == 'Colère'
          @emotion_transports_colere << thought_check.emotion
        elsif thought_check.emotion == 'Tristesse'
          @emotion_transports_tristesse << thought_check.emotion
        elsif thought_check.emotion == 'Culpabilité'
          @emotion_transports_culpa << thought_check.emotion
        elsif thought_check.emotion == 'Haine'
          @emotion_transports_haine << thought_check.emotion
        else thought_check.emotion == 'Frustration'
          @emotion_transports_frustra << thought_check.emotion
        end
      end
      if thought_check.situation == 'Au travail'
        @travail += 1
        @emotion_travail << thought_check.emotion
        if thought_check.emotion == 'Peur'
          @emotion_travail_peur << thought_check.emotion
        elsif thought_check.emotion == 'Colère'
          @emotion_travail_colere << thought_check.emotion
        elsif thought_check.emotion == 'Tristesse'
          @emotion_travail_tristesse << thought_check.emotion
        elsif thought_check.emotion == 'Culpabilité'
          @emotion_travail_culpa << thought_check.emotion
        elsif thought_check.emotion == 'Haine'
          @emotion_travail_haine << thought_check.emotion
        else thought_check.emotion == 'Frustration'
          @emotion_travail_frustra << thought_check.emotion
        end
      end

      if thought_check.situation == 'Dans mon lit'
        @lit += 1
        @emotion_lit << thought_check.emotion
        if thought_check.emotion == 'Peur'
          @emotion_lit_peur << thought_check.emotion
        elsif thought_check.emotion == 'Colère'
          @emotion_lit_colere << thought_check.emotion
        elsif thought_check.emotion == 'Tristesse'
          @emotion_lit_tristesse << thought_check.emotion
        elsif thought_check.emotion == 'Culpabilité'
          @emotion_lit_culpa << thought_check.emotion
        elsif thought_check.emotion == 'Haine'
          @emotion_lit_haine << thought_check.emotion
        else thought_check.emotion == 'Frustration'
          @emotion_lit_frustra << thought_check.emotion
        end
      end

      if thought_check.situation == 'Dans un magasin'
        @magasin += 1
        @emotion_magasin << thought_check.emotion
        if thought_check.emotion == 'Peur'
          @emotion_magasin_peur << thought_check.emotion
        elsif thought_check.emotion == 'Colère'
          @emotion_magasin_colere << thought_check.emotion
        elsif thought_check.emotion == 'Tristesse'
          @emotion_magasin_tristesse << thought_check.emotion
        elsif thought_check.emotion == 'Culpabilité'
          @emotion_magasin_culpa << thought_check.emotion
        elsif thought_check.emotion == 'Haine'
          @emotion_magasin_haine << thought_check.emotion
        else thought_check.emotion == 'Frustration'
          @emotion_magasin_frustra << thought_check.emotion
        end
      end

      if thought_check.situation == 'En vacances'
        @vacances += 1
        @emotion_vacances << thought_check.emotion
        if thought_check.emotion == 'Peur'
          @emotion_vacances_peur << thought_check.emotion
        elsif thought_check.emotion == 'Colère'
          @emotion_vacances_colere << thought_check.emotion
        elsif thought_check.emotion == 'Tristesse'
          @emotion_vacances_tristesse << thought_check.emotion
        elsif thought_check.emotion == 'Culpabilité'
          @emotion_vacances_culpa << thought_check.emotion
        elsif thought_check.emotion == 'Haine'
          @emotion_vacances_haine << thought_check.emotion
        else thought_check.emotion == 'Frustration'
          @emotion_vacances_frustra << thought_check.emotion
        end
      end

      if thought_check.situation == 'Au sport'
        @sport += 1
        @emotion_sport << thought_check.emotion
        if thought_check.emotion == 'Peur'
          @emotion_sport_peur << thought_check.emotion
        elsif thought_check.emotion == 'Colère'
          @emotion_sport_colere << thought_check.emotion
        elsif thought_check.emotion == 'Tristesse'
          @emotion_sport_tristesse << thought_check.emotion
        elsif thought_check.emotion == 'Culpabilité'
          @emotion_sport_culpa << thought_check.emotion
        elsif thought_check.emotion == 'Haine'
          @emotion_sport_haine << thought_check.emotion
        else thought_check.emotion == 'Frustration'
          @emotion_sport_frustra << thought_check.emotion
        end
      end

      if thought_check.situation == 'Autre'
        @autre += 1
        @emotion_autre << thought_check.emotion
        if thought_check.emotion == 'Peur'
          @emotion_autre_peur << thought_check.emotion
        elsif thought_check.emotion == 'Colère'
          @emotion_autre_colere << thought_check.emotion
        elsif thought_check.emotion == 'Tristesse'
          @emotion_autre_tristesse << thought_check.emotion
        elsif thought_check.emotion == 'Culpabilité'
          @emotion_autre_culpa << thought_check.emotion
        elsif thought_check.emotion == 'Haine'
          @emotion_autre_haine << thought_check.emotion
        else thought_check.emotion == 'Frustration'
          @emotion_autre_frustra << thought_check.emotion
        end
      end
    end    
    @transports
    @emotion_transports
    @travail
    @lit
    @magasin
    @vacances
    @sport
    @autre
    # method count which count each time thought_check.thought_check.situation = one situation
  end

  def show
    @thought_check = ThoughtCheck.find(params[:id])
    # I want to select only question about this thought
    @questions = Question.all.where(thought_check_id: params[:id])
    redirect_to new_thought_check_path unless @thought_check
  end

  def new
    session[:thought_check_params] ||= {}
    @thought_check = ThoughtCheck.new
    @thought_check.current_step = session[:thought_check_step]
  end

  def create
    @profile = Profile.find(current_user.id)
    session[:thought_check_params].deep_merge!(params[:thought_check]) if params[:thought_check]
    @thought_check = ThoughtCheck.new(session[:thought_check_params])
    @thought_check.profile = @profile
    @thought_check.current_step = session[:thought_check_step]
    if @thought_check.valid?
      if params[:previous_button] == "Retour"
        @thought_check.previous_step
      elsif @thought_check.last_step?
        @thought_check.save if @thought_check.all_valid?
      else
        @thought_check.next_step
      end
      session[:thought_check_step] = @thought_check.current_step
    end

    if @thought_check.new_record?
      render 'new'
    else
      flash[:notice] = "Pensée sauvegardée..."
      session[:thought_check_step] = session[:thought_check_params] = nil
      redirect_to thought_checks_path
    end
    # render 'new'
    # @profile = Profile.find(current_user.id)
    # @thought_check = ThoughtCheck.new(params_thought_check)
    # @thought_check.profile = @profile
    # if @thought_check.save
    #   redirect_to @thought_check
    # else
    #   render :new
    # end
  end

  def edit
    @thought_check = ThoughtCheck.find(params[:id])
  end

  def update
    @thought_check = ThoughtCheck.find(params[:id])
    @thought_check.update(params_thought_check)
    if @thought_check.save
      redirect_to thought_check_path
    else
      render :new
    end
  end

  def destroy
    @thought_check = ThoughtCheck.find(params[:id])
    @thought_check.destroy
  end

  private

  # def params_thought_check
  #   params.permit(:situation, :about, :thought, :emotion, :emotion_level, :physiological, :trust)
  # end

  # def set_thought_check
  #   @thought_check = ThoughtCheck.find(params[:id])
  # end
end
