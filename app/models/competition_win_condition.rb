class CompetitionWinCondition < ActiveRecord::Base
  has_many :competitions

  def compute_results(competition)
    @competition = competition
    @users = competition.users
    @exercises = competition.exercises
    self.send(computing_method_call)    
  end

  def computing_method_call
    name.downcase.gsub(" ", "_").to_sym
  end

  def most_completed_by_date
    compute_total_by(:value)
  end

  def highest_score_by_date
    compute_total_by(:total_experience)
  end

  def compute_total_by(variable)
    @users.each do |user|
      join = user.competition_joins.find_by(competition: @competition)
      total = 0
      @competition.competition_activities.where(user: user).each do |comp_activity|
        total += comp_activity.activity.send(variable)
      end
      join.update_attributes(total: total)
    end

    #Set rank
    @competition.competition_joins.order('total DESC').each_with_index do |comp_join, index|
      comp_join.update_attributes(rank: index+1) 
    end
  end
end
