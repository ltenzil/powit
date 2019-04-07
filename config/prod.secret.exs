use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :powit, PowitWeb.Endpoint,
  secret_key_base: "Rvx9S8JzsfzJIkSjAwUhbDPT8/ZoAl1b86yl0cjT016kB4R7WV+vyiPM2CP1FXIM"

# Configure your database
config :powit, Powit.Repo,
  username: "postgres",
  password: "postgres",
  database: "powit_prod",
  pool_size: 15
