class PostsController < ApplicationController

  http_basic_authenticate_with name:'admin', password:'password',
  except: [:index,:show]
    @@count = 0
  
  def index
    
    if (@@count <= 4)
      @query = ActiveRecord::Base.connection.execute("select * from posts where status = 0 ORDER BY lower(hex(randomblob(16))) LIMIT 1 ")[0]
      @code = @query["code"]
      @question = @query["question"]
      @point = @query["bal"]
      @post = Post.where(id: @code)
      @answer = Answer.where(fCODE: @code)

      Post.where(:code => @code).first.update(:status => 1)
      @@count = @@count + 1    
    else
      @@count = 0
      Post.update_all(status: 0)
    end

      # @post = Post.all()
  end

  def new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def create
  	@post = Post.new(post_params)
  	@post.save
  	redirect_to @post
  end

  private def post_params
  	params.require(:post).permit(:code,:question,:status,:bal)
  end
end
