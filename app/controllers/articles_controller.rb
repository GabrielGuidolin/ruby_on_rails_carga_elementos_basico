class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy] #Esto hace que el metodo set_article se ejecute antes de las acciones show, edit, update y destroy

    def show        
    end
    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(article_params)  #Usamos article_params para permitir solo los parametros permitidos
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to article_path(@article)
        else
            render :new, status: :unprocessable_entity
        end
    end
    def edit 
    end
    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to article_path(@article)
        else
            render :edit, status: :unprocessable_entity #El ultimo es para que no pierda los errores de validacion al renderizar la vista
        end
    end
    def destroy
        @article.destroy
        redirect_to articles_path
    end
    
    private
    def set_article
        @article = Article.find(params[:id])   #Esto sirve para encontrar el articulo por su id, el @ lo hace una variable de instancia
    end
    def article_params
        params.require(:article).permit(:title, :description)  
    end
end