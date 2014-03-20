namespace :ww do
  namespace :competitions do
    desc "Start competitions that start today"
    task :start => :environment do
      Competition.where("(?) > start_date", Time.now).each do |competition|
        competition.started = true
        competition.save!
      end
    end

    desc "Start competitions that start today"
    task :finish => :environment do
      Competition.where('end_date < (?)', Time.now).each do |competition|
        competition.finished = true
        competition.save!
      end
    end
  end

  namespace :activities do 
    desc "convert value to values"
    task :convert_value => :environment do
      Activity.find_each do |activity|
        # don't try to convert activities that don't have metric column or a value
        if activity.activity_values.empty? && activity.respond_to?(:metric) 
          metric = activity.exercise.metric
          value = activity.value
          ActivityValue.create!(activity: activity, metric: metric, value: value)
        end
      end
    end
  end
  namespace :exercises do 
    desc "create exercise metric models to attach exercises to metrics"
    task :reattach_metrics => :environment do 
      Exercise.find_each do |exercise|
        if exercise.respond_to?(:metric) 
          metric = exercise.metric
          ExerciseMetric.create!(exercise: exercise, metric: metric, experience_multiplier: exercise.experience_multiplier)
        end
      end
    end
  end
end