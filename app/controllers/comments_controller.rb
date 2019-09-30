class CommentsController < ApplicationController
  before_action :set_article_comment, only: [:create, :update, :destroy]

  def create

    @comment = @article.comments.create(comment_params)

    @comment.user_id=current_user.id if current_user

    @comment.save

    redirect_to article_path(@article)
  end

  # def update
  #   respond_to do |format|
  #     if @article.comments.update(comment_params)
  #       format.html { redirect_to article_path(@article), notice: 'Comment was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @article.comments }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @article.comments.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  def destroy

    @comment = @article.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to article_path(@article), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_article_comment
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end
end