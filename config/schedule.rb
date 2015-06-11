set :output, "/home/vagrant/works/tsubuyaki/log/crontab.log"
set :environment, :production
env :PATH, ENV['PATH']
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

every :hour do
  command "/home/vagrant/works/tsubuyaki/bin/tweet_specific_keyword -k tshirt -n 3 -l /home/vagrant/works/tsubuyaki/log/tweet_specific_keyword"
end

#every 1.minute do
#  command "/home/vagrant/works/tsubuyaki/bin/simple_tweet -k pumps"
#end

