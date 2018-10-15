class CommentsController < ApplicationController
  before_action :load_commentable, only: [:create]
  def create
    @comment = @commentable.comments.create(params[:comment].permit(:author, :content, :commentable_type))
    @comment.save
    redirect_to @commentable
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
