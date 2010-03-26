class EntertainmentsController < ApplicationController
  unloadable
  before_filter :find_entertainment, :only => [:show]
  before_filter :find_nav
  def index
    add_breadcrumb "Entertainment"
    if !params[:tag].blank?
      # Filter entertainment by tag
      found_entertainments = Entertainment.find_tagged_with(params[:tag])
      add_breadcrumb params[:tag]
    elsif !params[:entertainment_type].blank?
      found_entertainments = EntertainmentType.find(params[:entertainment_type]).entertainments
    else
      found_entertainments = Entertainment.all    
    end
    @page = Page.find_by_permalink("entertainment")
    @entertainment_types = EntertainmentType.all
    @entertainments = found_entertainments.paginate(:page => params[:page], :per_page => 50)  
  end

  def show
    @page = Page.find_by_permalink("entertainment")
    if @entertainment.images
      @images = @entertainment.images
    end
    @testimonial = Testimonial.find(:all, :conditions => ["quotable_id = ?" , @entertainment.id]).sort_by(&:rand).first #Select a random testimonial
  end


private
  def find_entertainment
    @entertainment = Entertainment.find(params[:id])
  end
  def find_nav
    @entertainment_types = EntertainmentType.all
  end
end
