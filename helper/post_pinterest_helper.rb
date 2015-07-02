$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))
require 'favrica_sns'

module PostPinterestHelper

  def post_pinterest
    headless = Headless.new
    headless.start
    driver = Selenium::WebDriver.for :chrome

    driver.navigate.to pinterest_url(self[0], self[1], self[2])
    logger.info("Access succeed: #{pinterest_url(self[0], self[1], self[2])}")

    username = driver.find_element(:xpath, "//li[@class='loginUsername']/input")
    username.send_keys(FavricaSns::PINTEREST_ID)

    password = driver.find_element(:xpath, "//li[@class='loginPassword']/input")
    password.send_keys(FavricaSns::PINTEREST_PASS)

    driver.find_element(:xpath, "//div[@class='formFooterButtons']/button").click
  end

  private

  def pinterest_url(favrica_url, image_url, item_description)
    "#{FavricaSns::PINTEREST_PINIT_URL}#{favrica_url}&media=#{image_url}&description=#{item_description.encode}"
  end

end
