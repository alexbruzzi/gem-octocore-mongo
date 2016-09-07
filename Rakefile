require 'yaml'
require 'redis'
require 'mongo_mapper'
require 'rspec/core/rake_task'

require 'octocore/config'

RSpec::Core::RakeTask.new('spec')

task :environment do
  config_dir = ENV['CONFIG_DIR'] || 'lib/octocore/config/'
  config = {}
  Dir[config_dir + '**{,/*/**}/*.yml'].each do |file|
    _config = YAML.load_file(file)
    if _config
      puts "loading from file: #{ file }"
      config = config.merge(_config.deep_symbolize_keys)
    end
  end
  Octo.load_config config
  mongo_uri = Octo.get_config(:mongo_uri)
  MongoMapper.setup({'production' => {'uri' => mongo_uri}}, 'production')
end

# Load default tasks from Cequel
spec = Gem::Specification.find_by_name 'mongo_mapper'
load "#{spec.gem_dir}/lib/mongo_mapper/railtie/database.rake"

# Overriding rake actions
namespace :octo do

  desc 'Create keyspace and tables for all defined models'
  task :init => %w(environment db:setup)

  desc 'Drop keyspace if exists, then create and migrate'
  task :reset => :environment do
    clear_cache
    task('db:drop').invoke
    task('db:create').invoke
  end
end

# Clear Cache
def clear_cache
  default_cache = {
    host: '127.0.0.1', port: 6379
  }
  redis = Redis.new(default_cache.merge(driver: :hiredis))
  redis.flushall
  puts 'Cache Cleaned'
end