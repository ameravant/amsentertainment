class EntertainmentsController < ApplicationController
  unloadable
  before_filter :find_entertainment, :only => [:show]
  before_filter :find_nav
  def index    
    if !params[:tag].blank?
      # Filter entertainment by tag
      found_entertainments = Entertainment.find_tagged_with(params[:tag])
    elsif params[:entertainment_type]
      found_entertainments = EntertainmentType.find_by_permalink(params[:entertainment_type]).entertainments
    else
      found_entertainments = Entertainment.all    
    end
    @page = Page.find_by_permalink("entertainment")
    @entertainments = found_entertainments.paginate(:page => params[:page], :per_page => 50)  
  end

  def show
    @page = Page.find_by_permalink("entertainment")
    if @entertainment.images
      @images = @entertainment.images
    end
    @testimonial = Testimonial.find(:all, :conditions => ["quotable_id = ?" , @entertainment.id]).sort_by(&:rand).first #Select a random testimonial
    add_breadcrumb "Entertainment", entertainments_path
    add_breadcrumb @entertainment.title
  end


private
  def find_entertainment
    @entertainment = Entertainment.find(params[:id])
    @owner = @entertainment
  end
  def find_nav
    @entertainment_types = EntertainmentType.all
  end
end
