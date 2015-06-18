set :output, "/home/dorian/Works/tsubuyaki/log/crontab.log"
set :environment, :production
env :PATH, ENV['PATH']
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

# 5分毎に行うタスク用
time = []
(0..23).to_a.each do |hour|
  (0..59).to_a.each do |minute|
    if minute % 5 == 0
      time << "#{'%02d' % hour}:#{'%02d' % minute}"
    end
  end
end

# 現状ではあまり:hourと代わり映えしないけど、細かく指定できる方がいいのでこちらで登録。あと夜つぶやいても仕方がない気がするので
# これだとただのスパムボットに成り下がっているので一旦すべて廃止
every 1.day, at: (6..23).to_a.map {|hour| hour = "#{'%02d' % hour}:00"} do
end

# 朝配信するボット
every 1.day, at: "06:30" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# お昼配信するボット
every 1.day, at: "12:00" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k outdoor -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k iPhone-case -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sneaker -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# 夜配信するボット
every 1.day, at: "18:25" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k tshirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k polo-shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k vest -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k parka -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sweat -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k outdoor -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# 夜の遅い時間帯に配信するボット
every 1.day, at: "21:00" do
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k iPhone-case -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k sneaker -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# follow follower of seed account
every :monday, at: time do
end

# follow mutual accounts
every :wednesday, at: time do
end

# unfollow not followback account
every 1.day, at: time do
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k tshirt -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k polo-shirt -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k vest -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k parka -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k sweat -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k outdoor -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k iPhone-case -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k sneaker -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
end
