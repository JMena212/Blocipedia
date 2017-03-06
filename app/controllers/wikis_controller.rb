class WikisController < ApplicationController
  def index
    # @wikis = current_user.wikis
     @wikis = Wiki.visible_to(current_user)
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)
      if @wiki.save
       flash[:notice] = "Wiki was saved successfully."
       redirect_to root_path
      else
       flash.now[:alert] = "Error creating Wiki. Please try again."
       render :new
      end
  end

  def new
    @wiki = Wiki.new
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "Wiki Removed"
      redirect_to root_path
    else
      flash[:alert] = "Wiki not removed"
      render :show
    end
  end

  def show
     @wiki = Wiki.find(params[:id])
      unless @wiki.public || current_user
       flash[:alert] = "You must be signed in to view private wikis."
       redirect_to root_path
      end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
     @wiki = Wiki.find(params[:id])
    if @wiki.update(wiki_params)
      flash[:notice] = "Wiki updated"
    else
      flash[:alert] = 'Error creating Wiki. Please try again'
    end
    redirect_to root_path
  end
  
  private
  def wiki_params
   params.require(:wiki).permit(:title, :body)
  end
  
end
