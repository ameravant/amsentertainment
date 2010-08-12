class InquiriesController < ApplicationController
  unloadable # http://dev.rubyonrails.org/ticket/6001
  add_breadcrumb "Home", "root_path"
  before_filter :find_page

  def new
    @inquiry = Inquiry.new
    add_breadcrumb @page.name, nil
    @person = Person.new
    @groups = PersonGroup.only_public
  end
  
  def create
    return unless params[:company].blank? # spam bots will fill this hidden field out
    @groups = PersonGroup.only_public
    # @event_date = Date.civil(params[:range][:"event_date(1i)"].to_i,params[:range][:"event_date(2i)"].to_i,params[:range][:"event_date(3i)"].to_i)
    params[:person][:email] = params[:inquiry][:email]
    #this check occurs to make sure people cannot set themselves to unauthorized groups
    #valid_groups = params[:person][:person_group_ids].reject{|p| !@groups.collect(&:id).include?(p)}
    @person = Person.find_or_create_by_email(params[:person])
    if !@person.valid?
      flash[:error] = "Please make sure you enter your first and last name, and phone"
      @inquiry = Inquiry.new(params[:inquiry])
      render :action => 'new'
    else
      if params[:person][:person_group_ids]
        @person.person_group_ids |= params[:person][:person_group_ids].collect{|i| i.to_i}
      end
      @person.save
      params[:inquiry][:name] ="#{params[:person][:first_name]} #{params[:person][:last_name]}"
      params[:inquiry][:person_id] = @person.id
      params[:inquiry][:phone] = @person.phone
      @inquiry = Inquiry.new(params[:inquiry])
      @event_details = params[:event]
      if !@inquiry.save
        render :action => "new"
      else
        InquiryMailer.deliver_notification_to_admin(@inquiry, @event_details)
        InquiryMailer.deliver_confirmation_to_user(@inquiry)
        @inquiry_page = Page.find_by_permalink!('inquire')
        @page = Page.find_by_permalink!('inquiry_received') # used in create view
        add_breadcrumb @inquiry_page.name, "/#{@inquiry_page.permalink}"
        add_breadcrumb "Message sent"
      end
    end
  end

  def find_page
    @page = Page.find_by_permalink!('inquire')
    @article_categories = ArticleCategory.active
    @article_archive = Article.published.group_by { |a| [a.published_at.month, a.published_at.year] }
    @article_authors = Person.active.find(:all, :conditions => "articles_count > 0")
    @article_tags = Article.published.tag_counts.sort_by(&:name)
  end

end

