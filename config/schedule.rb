set :output, "/home/dorian/Works/tsubuyaki/log/crontab.log"
set :environment, :production
env :PATH, ENV['PATH']
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

# 7分毎に行うタスク用
time = []
(0..23).to_a.each do |hour|
  (0..59).to_a.each do |minute|
    if minute % 7 == 0
      time << "#{'%02d' % hour}:#{'%02d' % minute}"
    end
  end
end

# 9分毎に行うタスク用
time2 = []
(0..23).to_a.each do |hour|
  (0..59).to_a.each do |minute|
    if minute % 9 == 0
      time2 << "#{'%02d' % hour}:#{'%02d' % minute}"
    end
  end
end

# 毎時7回分をランダムに選択して実行するタスク用
random_times = []
(0..23).to_a.each do |hour|
  (0..59).to_a.sample(7).each do |minute|
    random_times << "#{'%02d' % hour}:#{'%02d' % minute}"
  end
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
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k one-piece -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
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
  command "/home/dorian/Works/tsubuyaki/bin/tweet_specific_keyword -k one-piece -n 3 -l /home/dorian/Works/tsubuyaki/log/tweet_specific_keyword -e"
end

# follow follower of seed account
every :monday, at: time do
end

# follow mutual accounts
every :wednesday, at: time do
end

# unfollow not followback account
bot_keyword_en = %w(tshirt shirt polo-shirt vest parka sweat outdoor iPhone-case sneaker knit cardigan ensemble jersey tanktop tubetop jacket blouson down mountain-parka skirt pants denim sandal pumps boots booties deck-shoes rain-shoes all-in-one one-piece party-dress suit-jacket suit-vest suit-pants suit-skirt setup necktie bra shorts-panties mens-pants necklace pierced-earrings ring swimsuit tote-bag backpack traveling-bag)
bot_keyword_en.each do |keyword|
  every 1.day, at: time do
    command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k #{keyword} -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
  end
end

every 1.day, at: time2 do
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k handbag -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k clutch-bag -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k gaucho-pants -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k dress-shoes -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k hat -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k peplum -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k off-shoulder -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
#  command "/home/dorian/Works/tsubuyaki/bin/unfollow_not_followback_account -k linen -n 3 -l /home/dorian/Works/tsubuyaki/log/unfollow_not_followback_account -e"
end

