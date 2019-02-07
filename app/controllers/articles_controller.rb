class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        # render plain: params[:article].inspect
        # @article = Article.new(params[:article]) //Error!
        # @article = Article.new(params.require(:article).permit(:title, :text))

        @article = Article.new(article_parms)

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    private
    def article_parms
        params.require(:article).permit(:title, :text)
    end
end
