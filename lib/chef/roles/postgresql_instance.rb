name "postgresql_instance"
description "Postgresql instance install"

all_env = [
  "role[base]",
  "recipe[postgresql::server]",
  "recipe[postgresql::client]",
  "recipe[postgresql::setup_users]"
]

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "production" => all_env,
  "staging" => all_env,
  "development" => all_env
)

default_attributes(
  "postgresql" => {
    "version" => "9.3",
    "listen_addresses" => "0.0.0.0",
    "users" => [{
      "username" => "vagrant",
      "password" => "vagrant",
      "superuser" => true,
      "createdb" => true,
      "createrole" => true,
      "inherit" => true,
      "login" => true
    }, {
      "username" => "developer",
      "password" => "developer",
      "superuser" => true,
      "createdb" => true,
      "createrole" => true,
      "inherit" => true,
      "login" => true
    }],
    "pg_hba" => [ # Only for DEV use:
      { "type" => 'local', "db" => 'all', "user" => 'all', "addr" => '', "method" => 'trust' },
      { "type" => 'host', "db" => 'all', "user" => 'all', "addr" => '192.168.10.0/24', "method" => 'trust' }
    ]
  }
)
