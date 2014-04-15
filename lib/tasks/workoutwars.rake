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

    desc "Send Start Notifications"
    task :start_notifications => :environment do
      Competition.where(started: false).each do |competition|
        notification = Notification.find_by(name: 'Competition Start')
        competition.users.each do |user|
          if user.notification_is_active?(notification)
            user_notification = user.user_notifications.where(notification: notification).first
            num_of_hours = user_notification.time_period 
            if num_of_hours.hours.from_now > competition.start_date
              message = "#{competition.name} is going to start within #{num_of_hours} hours"
              user.send_push_notifications(message)
            end
          end
        end
      end
    end

    desc "Send Finish Notifications"
    task :finish_notifications => :environment do
      Competition.where(finished: false).each do |competition|
        notification = Notification.find_by(name: 'Competition End')
        competition.users.each do |user|
          if user.notification_is_active?(notification)
            user_notification = user.user_notifications.where(notification: notification).first
            num_of_hours = user_notification.time_period 
            if num_of_hours.hours.from_now > competition.end_date
              message = "#{competition.name} is going to end within #{num_of_hours} hours"
              user.send_push_notifications(message)
            end
          end
        end
      end
    end
  end
end