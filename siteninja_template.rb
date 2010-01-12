run "rm public/index.html"

inside('vendor/plugins/siteninja') do
  run "echo SiteNinja will now be populated with the basic plugins for operation."
  run "svn co http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/acts_as_taggable_on_steroids http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/ar_mailer http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/engines http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/faker http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/fu-fu http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/haml http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/paperclip http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/permalink_fu http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/restful_authentication http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/will_paginate http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/tiny_mce http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/siteninja_blogs http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/siteninja_core http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/siteninja_pages http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/siteninja_setup"

run "echo Please choose what options you would like to populate this site with."

end

  inside('vendor/plugins/siteninja/siteninja_setup') do
    run "echo Copying default application layout, stylesheets and configuration files..."
    run "mv application.html.haml #{RAILS_ROOT}/app/views/layouts"
    run "mv application_controller.rb #{RAILS_ROOT}/app/controllers"
    run "mv routes.rb #{RAILS_ROOT}/config"
    run "mv cms.yml #{RAILS_ROOT}/config"
    run "mv database.yml #{RAILS_ROOT}/config"
    run "mv permissions.yml #{RAILS_ROOT}/config"
    run "mv environment.rb #{RAILS_ROOT}/config"
    run "mv production.rb #{RAILS_ROOT}/config/environments"
    run "mv *.css #{RAILS_ROOT}/public/stylesheets"
  end
  #This section is for populating the config files of the new site
  cms_yml = YAML::load_file("#{RAILS_ROOT}/config/cms.yml")
  cms_yml['website']['demo'] = false
  cms_yml['website']['name'] = ask("What is the new full name of the new site (ex: Site Ninja)?") #name
  cms_yml['website']['domain'] = ask("What is the domain of the new site do not add www (ex: site-ninja.com )") #domain
  cms_yml['website']['logo_position'] = ask("Where should the logo for the site be placed? ( top, menu )") #logo_position
  cms_yml['website']['template'] = ask("What template would you like to use? ( t3c2..5 , demo )") #template
  cms_yml['modules']['blog'] = yes?("Will this site have a blog? ") #blog
  #GALLERIES
  if yes?("Do you want to install galleries?")
    run "svn co http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/siteninja_galleries vendor/plugins/siteninja/siteninja_galleries
    echo 'map.from_plugin :siteninja_galleries' >> #{RAILS_ROOT}/config/routes.rb"
    cms_yml['modules']['galleries'] = true
  else
    cms_yml['modules']['galleries'] = false
  end
  #NEWSLETTERS
  if yes?("Do you want to install newsletters?")
    run "svn co http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/siteninja_newsletters vendor/plugins/siteninja/siteninja_newsletters
    echo 'map.from_plugin :siteninja_newsletters' >> #{RAILS_ROOT}/config/routes.rb"
    cms_yml['modules']['newsletters'] = true
  else
    cms_yml['modules']['newsletters'] = false
  end
  #EVENTS
  if yes?("Do you want to install events?")
    run "svn co http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/siteninja_events vendor/plugins/siteninja/siteninja_events
    echo 'map.from_plugin :siteninja_events' >> #{RAILS_ROOT}/config/routes.rb"
    cms_yml['modules']['events'] = true
    cms_yml['features']['event_registration'] = yes?("Do you want to enable event_registration?")
  else
    cms_yml['modules']['events'] = false
  end
  #LINKS
  if yes?("Do you want to install links?")
    run "svn co http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/siteninja_links vendor/plugins/siteninja/siteninja_links
    echo 'map.from_plugin :siteninja_links' >> #{RAILS_ROOT}/config/routes.rb"
    cms_yml['modules']['links'] = true
  else
    cms_yml['modules']['links'] = false
  end
  #STORE/PRODUCTS
  if yes?("Do you want to install the products system?")
    run "svn co http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/siteninja_store vendor/plugins/siteninja/siteninja_store
    echo 'map.from_plugin :siteninja_store' >> #{RAILS_ROOT}/config/routes.rb"
    cms_yml['modules']['product'] = true
    if yes?("Do you want to enable the store for products?")
      cms_yml['modules']['store'] = true
      plugin 'active_merchant', :git => "git://github.com/Shopify/active_merchant.git"
    end
  else
    cms_yml['modules']['store'] = false
    cms_yml['modules']['product'] = false
  end
  #DOCUMENTS
  if yes?("Do you want to install documents?")
    run "svn co http://66.103.153.150:86/svn/repository/siteninja/vendor/plugins/siteninja/siteninja_documents vendor/plugins/siteninja/siteninja_documents
    echo 'map.from_plugin :siteninja_documents' >> #{RAILS_ROOT}/config/routes.rb"
    cms_yml['modules']['documents'] = true
  else
    cms_yml['modules']['documents'] = false
  end
  #FEATURES
  cms_yml['features']['feature_box'] = yes?("Do you want this site to have feature box?") #contacts
  cms_yml['features']['testimonials'] = yes?("Do you want testimonials available?")

  run "echo 'map.from_plugin :siteninja_pages # Must be last! \n end' >> #{RAILS_ROOT}/config/routes.rb"
  if yes?("Do you want to remove subversion information)?")
    run "find #{RAILS_ROOT}/vendor/plugins/siteninja -name .svn | xargs rm -rf"
  end

  File.open("#{RAILS_ROOT}/config/cms.yml", 'w') { |f| YAML.dump(cms_yml, f) }
  #Database info populated here
  if yes?("Do you need to enter information for the production server database?")
    db_yml = YAML::load_file("#{RAILS_ROOT}/config/database.yml")
    db_yml['production']['database'] = ask("What is the name of the database (ex: siteninj_db)?")
    db_yml['production']['username'] = ask("What is the username for the database (ex: siteninj_admin)?")
    db_yml['production']['password'] = ask("What is the password the database (ex: 123Mail j/k)?")
    File.open("#{RAILS_ROOT}/config/database.yml", 'w') { |f| YAML.dump(db_yml, f) }
  end


  #generate(:plugin_migration)
  #run "mv db/migrate/plugin_migrations.rb db/migrate/plugin_migration.rb"
  #  if yes?("Is this site running on the production server?")
  #    rake("db:drop db:create db:migrate db:populate_min RAILS_ENV=production")
  #  else
  #    rake("db:drop db:create db:migrate")
  #    run "echo Populating site with minimal data for operation..."
  #    rake("db:populate_min")
  #  end


  run("rm -rf #{RAILS_ROOT}/vendor/plugins/siteninja/siteninja_setup")

