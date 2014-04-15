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
      @competition.competition_user_exercises.where(user_id: user.id).each do |comp_user_exercise|
        total += comp_user_exercise.user_exercise.send(variable)
      end
      join.update_attributes(total: total)
    end

    #Set rank
    @competition.competition_joins.order('total DESC').each_with_index do |comp_join, index|
      send_competition_rank_notifications(comp_join.user, index+1, comp_join.rank) if comp_join.rank < index+1
      comp_join.update_attributes(rank: index+1) 
    end
  end

  def send_competition_rank_notifications(user, new_rank, old_rank)
    notification = Notification.find_by(name: 'Competition Rank')
    message = "Your rank has dropped from #{old_rank} to #{new_rank} in the competition #{@competition.name}"
    user.send_push_notifications(message) if user.notification_is_active?(notification)
  end
end
