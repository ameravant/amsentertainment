include RoutesHelper
ActionController::Routing::Routes.draw do |map|
  map.resource :session
  map.from_plugin :siteninja_core
  map.from_plugin :siteninja_blogs
  map.from_plugin :siteninja_links
  map.from_plugin :ams
  map.from_plugin :siteninja_pages # Must be last! 
 end
