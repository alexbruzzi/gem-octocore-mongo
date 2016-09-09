rm *.gem
gem build octocore-mongo.gemspec && gem uninstall octocore-mongo --force
find . -name '*.gem' | xargs gem install
