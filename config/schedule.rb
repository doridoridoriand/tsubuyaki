set :output, "/home/dorian/Works/tsubuyaki/log/crontab.log"
set :environment, :production
env :PATH, ENV['PATH']
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

#every :hour do
#  command "/home/vagrant/works/tsubuyaki/bin/tweet_specific_keyword -k tshirt -n 3 -l /home/vagrant/works/tsubuyaki/log/tweet_specific_keyword"
#end

# 現状ではあまり:hourと代わり映えしないけど、細かく指定できる方がいいのでこちらで登録。あと夜つぶやいても仕方がない気がするので
every 1.day, at: (6..23).to_a.map {|hour| hour = "#{hour}:00"} do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

#every 1.minute do
#  command "/home/vagrant/works/tsubuyaki/bin/simple_tweet -k pumps"
#end

