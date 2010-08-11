RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')
require File.join(File.dirname(__FILE__), '../vendor/plugins/siteninja/engines/boot')

Rails::Initializer.run do |config|
  config.i18n.default_locale = :en
  config.active_record.observers = :comment_observer, :inquiry_observer

  if Rails.env.production?
    cms_config = YAML::load_file("#{RAILS_ROOT}/config/cms.yml")
  else
    config.action_mailer.default_url_options = { :host => "localhost:3000" }
  end
  config.plugins = [ :siteninja_core, :all, :ams ]
  # config.gem "will_paginate"
end
require 'searchlogic'
require 'hirb'
Hirb.enable

