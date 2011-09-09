class EntertainmentTypesController < ApplicationController
unloadable
  def show
    @page = Page.find_by_permalink("entertainment")
    @entertainment_types = EntertainmentType.all
    @entertainments = EntertainmentType.find_by_permalink(params[:id]).entertainments.paginate(:page => params[:page], :per_page => 50)
    @entertainment_type = EntertainmentType.find_by_permalink(params[:id])
    add_breadcrumb "Entertainment", entertainments_path
    add_breadcrumb @entertainment_type.title
  end

end