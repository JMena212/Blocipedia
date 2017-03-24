class CollaborationsController < ApplicationController
    def create
        u = User.find(params[:user_id])
        w =  Wiki.find(params[:wiki_id])
        c = Collaboration.new(user_id: u.id, wiki_id: w.id)
        if c.save
            flash[:notice]= 'Collaboration added'
            redirect_to edit_wiki_path(w)
        else
            flash[:alert]= 'Failed to add collaboration'
            redirect_to root_path
        end
    end

    def destroy
        u = User.find(params[:user_id])
        w =  Wiki.find(params[:wiki_id])
        c = Collaboration.find_by(user_id: u.id, wiki_id: w.id)
        if c.destroy
            flash[:notice]= 'Collaborator removed'
            redirect_to edit_wiki_path(w)
        else
            flash[:alert]= 'Failed to remove collaboration'
            redirect_to root_path
        end
    end
end
