class CommentsController < ApplicationController

  http_basic_authenticate_with name: "David", password: "1a2s3d4f%", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comments_params)
    redirect_to_article_path(@article)
  end

  def destroy
    @article = ARticle.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
