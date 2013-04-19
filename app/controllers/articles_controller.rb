class ArticlesController < ApplicationController
    before_filter :require_login, except: [:index, :show] #authentication needed for new, create, edit, update and destroy.
  # GET /articles
  # GET /articles.json
  def index
    #Added for sunspot search 
    @search = Article.search do
      fulltext params[:search]
      with(:updated_at).less_than(Time.zone.now) #Stops future articles being displayed.
      facet(:publish_month)
      with(:publish_month, params[:month]) if params[:month].present?
    end
    @articles = @search.results.reverse #sunspot display articles
    #end sunspot search

    
    #@articles = Article.all.reverse #Allows articles to be displayed newest first.
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    #For Adding comments
    @comment = Comment.new
    @comment.article_id = @article.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
