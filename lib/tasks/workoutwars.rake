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
end