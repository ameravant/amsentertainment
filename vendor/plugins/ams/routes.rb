resources :artist_types, :genres, :entertainment_types
resources :artists, :entertainments, :has_many => [:images, :testimonials]

namespace :admin do |admin|
  admin.resources :genres, :artist_types, :entertainment_types
  admin.resources :artists, :has_many => [:assets, :testimonials, :features], :member => {:reorder => :put} do |artist|
    artist.resources :images, :member => { :reorder => :put }, :collection => { :reorder => :put }
  end
  admin.resources :entertainments, :has_many => [:assets, :testimonials, :features], :member => {:reorder => :put} do |entertainment|
    entertainment.resources :images, :member => { :reorder => :put }, :collection => { :reorder => :put }
  end
end

entertainments "/entertainment", :controller => 'entertainments', :action => "index"