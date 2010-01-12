# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_amsenter_session',
  :secret      => '301fe45931a1efd2ca261c47608167beabeb19af7fc72069ba71a51877cb073fd7ccbf53f1b251a107416c192fdd020884cf1a87fc6d5eccedee0c64040f056c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
