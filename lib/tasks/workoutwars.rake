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
        if activity.try(:value) && activity.respond_to?(:metric) 
          metric_name = activity.exercise.metric.sym_name
          value = activity.value

          activity.values = {metric_name => value}
          activity.save
        end
      end
    end
  end
end