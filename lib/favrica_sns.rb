require 'active_record'
require 'cache_local'
require 'yaml'
require 'optparse'
require 'logger'
require 'json'
require 'open-uri'
require 'uri'
require 'bot_account'
require 'seed_account'
require 'favrica_keyword'

db_config = YAML.load_file(File.expand_path(File.join(__FILE__, '..', '..', 'config', 'database.yml')))
ActiveRecord::Base.establish_connection(db_config['db']['production'])

module FavricaSns
  CACHE_DIR = File.expand_path(File.join(__FILE__, '..', '..', 'tmp', 'cache'))
  LOG_DIR = File.expand_path(File.join(__FILE__, '..', '..', 'log'))
  FAVRICA_SEARCH_URL_ENDPOINT = 'https://favrica.net/api/v3/items/search?text='
  DESCRIPTION_TRUNCATE = [0, 55]
end
