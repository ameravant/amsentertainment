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
    else
      found_entertainments = Entertainment.all    
    end
    @page = Page.find_by_permalink("entertainment")
    @entertainment_types = EntertainmentType.all
    @entertainments = found_entertainments.paginate(:page => params[:page], :per_page => 50)  
  end

  def show
    @page = Page.find_by_permalink("entertainment")
  end


private
  def find_entertainment
    @entertainment = Entertainment.find(params[:id])
  end
  def find_nav
    @entertainment_types = EntertainmentType.all
  end
end
