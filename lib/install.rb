require 'fileutils'

flashobject = File.dirname(__FILE__) + '/../../../../../public/plugin_assets/amsentertainment/javascripts/flashobject.js'
FileUtils.cp File.dirname(__FILE__) + '/../assets/javascripts/flashobject.js', flashobject unless File.exist?(flashobject)
# puts IO.read(File.join(File.dirname(__FILE__), 'README'))