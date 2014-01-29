namespace :ww do
  namespace :competitions do
    desc "Start competitions that start today"
    task :start_competitions => :environment do
      Competition.where('start_date <= ?', Date.today).each do |competition|
        competition.update_attributes(started: true)
      end
    end

    desc "Start competitions that start today"
    task :finish_competitions => :environment do
      Competition.where('end_date < ?', Date.today).each do |competition|
        competition.update_attributes(finished: true)
      end
    end
  end
end