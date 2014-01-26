namespace :ww do
  namespace :db do
    desc "merge 250 classes"
    task :test_prepare => :environment do
      Competition.destroy_all
    end
  end
end