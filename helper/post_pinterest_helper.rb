$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))
require 'favrica_sns'

module PostPinterestHelper

  def post_pinterest(target_keyword, button_place)
    headless = Headless.new
    headless.start

    driver = Selenium::WebDriver.for :chrome

    driver.navigate.to FavricaSns::PINTEREST_LANDING_PAGE

    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")

    username = driver.find_element(:xpath, "//li[@class='loginUsername']/input")
    username.send_keys(FavricaSns::PINTEREST_ID)

    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")

    password = driver.find_element(:xpath, "//li[@class='loginPassword']/input")
    password.send_keys(FavricaSns::PINTEREST_PASS)

    driver.find_element(:xpath, "//div[@class='formFooterButtons']/button").click

    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")

    driver.navigate.to pinterest_url(self[:favrica_url], self[:image].sample, self[:tweet_description_no_favrica_url])

    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")

    driver.find_element(:xpath, "//ul[@class='section allBoards']/ul[@class='sectionItems']/li[#{button_place}]").click

    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")
    driver.save_screenshot("#{FavricaSns::SCREENSHOT_SAVE_PLACE}#{target_keyword}_#{Time.now.to_s}.png")

    driver.quit
    headless.destroy
  end

  private

  def pinterest_url(favrica_url, image_url, item_description)
    URI.escape("#{FavricaSns::PINTEREST_PINIT_URL}#{favrica_url}&media=#{image_url}&description=#{item_description}")
  end

end
