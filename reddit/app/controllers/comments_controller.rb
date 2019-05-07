class CommentsController < ApplicationController

    def new
        @comment = Comment.new
        render :new
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.author_id = current_user.id
        @comment.post_id = params[:comment][:post_id]
        if @comment.save
            if @comment.parent_comment_id.nil?
                redirect_to post_url(params[:comment][:post_id])
            else
                redirect_to comment_url(@comment.parent_comment_id)
            end
        else
            flash.now[:errors] = @comment.errors.full_messages
            render :new
        end
    end

    def show
        @comment = Comment.find(params[:id])
        render :show
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :parent_comment_id)
    end



end