class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[ edit update create ]

  def create
    @publication = Publication.find(params[:comment][:publication_id])
    @comment = @publication.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to publication_path(@publication.id), notice: "Comment was successfully created." }
      else
        format.html { redirect_to publication_path(@publication.id), notice: "Comment was not created." }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :publication_id, :user_id)
  end
end
