class Admin::AssetsController < AdminController
  unloadable # http://dev.rubyonrails.org/ticket/6001
  before_filter :find_asset, :only => [ :edit, :update, :destroy, :restore ]
  before_filter :get_owner_and_authorize
  
  def index
    if @owner
      if params[:q].blank?
        @all_assets = @owner.assets
      else
        @all_assets = Asset.find(:all, :conditions => ["name like ? and attachable_id = ? and attachable_type = ?", "%#{params[:q].strip}%", @owner.id, @owner_type])
      end
    else
      if params[:q].blank?
        @all_assets = Asset.all
      else
        @all_assets = Asset.find(:all, :conditions => ["name like ?", "%#{params[:q].strip}%"])
      end
    end
    @assets = @all_assets.paginate(:page => params[:page], :per_page => 30)
    add_breadcrumb "Assets" unless @owner
  end
  
  def new
    @asset = Asset.new
    add_breadcrumb "Assets", @owner ? [:admin, @owner, :assets] : "admin_assets_path"
      add_breadcrumb "Upload a new asset", nil
  end
  
  def create
    if @owner
      @asset = @owner.assets.build(params[:asset])
      if @asset.save
        flash[:notice] = "#{@asset.name.titleize} uploaded to #{@owner.title}."
        redirect_to [:admin, @owner, :assets]
      else
        render :action => "new"
      end
    else
      @asset = Asset.new params[:asset]
      if @asset.save
        flash[:notice] = "#{@asset.name.titleize} uploaded successfully."
        redirect_to admin_assets_path
      else
        render :action => "new"
      end
    end
  end
  
  def edit
    add_breadcrumb "Assets", @owner ? [:admin, :assets, @owner] : "admin_assets_path"
    add_breadcrumb "Edit asset", nil
  end
  
  def update
    if @owner      
      if @asset.update_attributes params[:asset]
        @asset = @owner.assets.build(params[:asset])
        flash[:notice] = "#{@asset.name.titleize} uploaded to #{@owner.title}."
        redirect_to [:admin, @owner, :assets]
      else
        render :action => "edit"
      end
    else
      if @asset.update_attributes params[:asset]
        flash[:notice] = "#{@asset.name.titleize} updated."
        redirect_to admin_assets_path
      else
        render :action => 'edit'
      end
    end
  end
  
  def destroy
    @asset.destroy
    respond_to :js
  end


  private
  
    def find_asset
      @asset = Asset.find params[:id]
    end
    
    def get_owner_and_authorize
      if params[:folder_id] 
        @owner = Folder.find_by_permalink params[:folder_id]
        @owner_type = "folder"
      elsif params[:article_id] 
        @owner = Article.find params[:article_id]
        @owner_type = "article"   
      elsif params[:artist_id]
        @owner = Artist.find params[:artist_id]
        @owner_type = "artist"    
      elsif params[:entertainment_id]
        @owner = Entertainment.find params[:entertainment_id]
        @owner_type = "entertainment"    
      end
      add_breadcrumb @owner_type.capitalize, eval("admin_#{@owner_type.pluralize}_path") if @owner
      if @owner_type == "article"
        authorize(@permissions['articles'], "Articles")
      elsif @owner_type == "artist"
        authorize(@permissions['artists'], "Artists")
      elsif @owner_type == "entertainment"
        authorize(@permissions['entertainment'], "Entertainment")
      else
        authorize(@permissions['assets'], "Assets")
      end
    end
    
end
