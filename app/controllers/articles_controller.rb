class ArticlesController < ApplicationController
http_basic_authenticate_with name: "admin", password: "password", except: [:index, :show]
	
	# Сочетание действия Index и Поиска в одном
	def index
		@articles = Article.where(["title LIKE ?","%#{params[:search]}%"])
	end

	# Действие для вывода одной статьи
	def show
		@article = Article.find(params[:id])
	end

	# Действие которое выводит форму для создания статей
	def new
		@article = Article.new
	end

	# Действие которое выводит форму для редактироания статьи
	def edit
		@article = Article.find(params[:id])
	end

	# Действие которое создаёт новую статью с заполненными параметрами, которые принимаются из приватного метода
	# HTTP - POST
	def create
	 	@article = Article.new(article_params)
	 	
	 	if @article.save
	 		redirect_to @article
	 	else
	 		render 'new'
	 	end
	end 

	# Действие обновляющее статью (HTTP - PATCH/PUT)
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	# Действие удаляющее статью (HTTP - DELETE)
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	# Приватный метод который передаёт параметры
	private
	def article_params
    	params.require(:article).permit(:title, :text)
  	end
end
