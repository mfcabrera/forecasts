# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_forecasts_session',
  :secret      => 'df30c2e767cd87d9b508023f76635ef384aa74d541653fa5420a278f2153bc6cf6cbd314f0da0deb2ea202fa89bcab49f34263d7ece13febf7cea8891376c93c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
