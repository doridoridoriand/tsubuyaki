$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))
require 'favrica_sns'

module PostPinterestHelper

  def post_pinterest
    headless = Headless.new
    headless.start
    driver = Selenium::WebDriver.for :chrome

    p pinterest_url(self[:favrica_url], self[:image].sample, self[:tweet_description_no_favrica_url])
    driver.navigate.to pinterest_url(self[:favrica_url], self[:image].sample, self[:tweet_description_no_favrica_url])

    driver.save_screenshot('/home/vagrant/dev/unko0.png')

    driver.find_element(:xpath, "//div[@class='savePinDialog']/div/div/a").click

    driver.save_screenshot('/home/vagrant/dev/unko1.png')
    sleep(5)
    driver.save_screenshot('/home/vagrant/dev/unko1_1.png')
    sleep(5)
    driver.save_screenshot('/home/vagrant/dev/unko1_2.png')

    username = driver.find_element(:xpath, "//li[@class='loginUsername']/input")
    username.send_keys(FavricaSns::PINTEREST_ID)

    driver.save_screenshot('/home/vagrant/dev/unko2.png')

    password = driver.find_element(:xpath, "//li[@class='loginPassword']/input")
    password.send_keys(FavricaSns::PINTEREST_PASS)

    driver.save_screenshot('/home/vagrant/dev/unko3.png')

    driver.save_screenshot('/home/vagrant/dev/unko4.png')

    driver.find_element(:xpath, "//div[@class='formFooterButtons']/button").click

    driver.save_screenshot('/home/vagrant/dev/unko5.png')
    sleep(5)
    driver.save_screenshot('/home/vagrant/dev/unko6.png')
    sleep(5)
    driver.save_screenshot('/home/vagrant/dev/unko7.png')
    sleep(5)

    driver.find_element(:xpath, "//ul[@class='sectionItems']/li/div/button").click

    driver.save_screenshot('/home/vagrant/dev/unko8.png')
    sleep(5)
    driver.save_screenshot('/home/vagrant/dev/unko9.png')
    sleep(5)
    driver.save_screenshot('/home/vagrant/dev/unko10.png')
  end

  private

  def pinterest_url(favrica_url, image_url, item_description)
    URI.escape("#{FavricaSns::PINTEREST_PINIT_URL}#{favrica_url}&media=#{image_url}&description=#{item_description}")
  end

end
