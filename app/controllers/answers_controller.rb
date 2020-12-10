class AnswersController < ApplicationController
  
  def create
  	# render plain: params[:answer].inspect
  	@post = Post.find(params[:post_id])
  	@answer = @post.answers.create(answer_params)
  	redirect_to post_path(@post)
  end
  private def answer_params
  	params.require(:answer).permit(:fCODE,:fANSWER,:fTRUEFALSE)
  end
end
