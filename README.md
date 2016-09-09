# octocore-mongo

This is the Octomatic Enterprise Core gem for MongoDB. It provides most of the ORM stuff for MongoDB. Class and modules for different tables.

## Installting

```bash
gem install octocore-mongo
```

In case you are using bundler, you need to add something like this to your Gemfile:

```ruby
gem 'octocore-mongo', :git => 'git@github.com:octoai/gem-octocore-mongo.git'
```



## DB Migrations

### OctoAdmin CLI

This gem comes with a handy utility called `octocore-admin-mongo`. You can use this utility for db migrations, reset and init.

```bash
$ octocore-admin-mongo action path/to/config/dir
```

Where

- `action`: The action to be performed. One of `init`, `migrate` or `reset`
- `/path/to/config/dir`: The path where your config dir is placed


# Development

## Clone the repo

`$ git clone git@github.com:octoai/gem-octocore-mongo.git`

## Building

```bash
$ ./bin/clean_setup.sh
```

## Specs

```bash
$ rake spec
```

# Verifying connectivity

You can use the following set of commands in `irb` to verify all things working with this gem. Execute it from irb in PROJ_DIR.

```ruby
require 'octocore-mongo'
config_dir = '/path/to/config/dir'
Octo.connect_with_config_file config_dir
```

# Creating fake stream

It ships with a utility called `fakestream`. It will automatically stream random data. To use just open your console and type

```bash
$ fakestream-mongo /path/to/config/dir
```
