desc "This task is called by the Heroku cron add-on"
task :update_contracts => :environment do
    puts "Updating feed..."
    Contract.import_contracts
    puts "done."
  end
  
  task :send_reminder => :environment do 
     puts "Sending Emails"
     # Contract.send_reminders
      Contract.send_reminders
     puts "done."
  end
  
  task :send_user_reminder => :environment do 
      puts "Sending Emails"
      # Contract.send_reminders
       Contract.send_user_reminders
      puts "done."
   end