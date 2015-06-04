require 'active_record'
require 'yaml'
require 'bot_account'
require 'seed_account'
require 'keyword'

db_config = YAML.load_file(File.expand_path(File.join(__FILE__, '..', '..', 'config', 'database.yml')))
ActiveRecord::Base.establish_connection(db_config['db']['production'])

module LocalNews
  CACHE_DIR = File.expand_path(File.join(__FILE__, '..', '..', 'tmp', 'cache'))
end
