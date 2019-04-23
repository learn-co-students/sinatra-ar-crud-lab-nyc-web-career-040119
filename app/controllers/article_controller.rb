class ArticleController < ApplicationController
  # CREATE
  get '/articles/new' do
    @articles = Article.all
    erb :"articles/new"
  end

  post '/articles' do
    # creates a new Article object in database
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  # READ
  get '/articles' do
    @articles = Article.all
    erb :"articles/index"
  end

  get '/articles/:id' do
    # match the id to show
    @article = Article.find(params[:id])
    erb :"articles/show"
  end

  # UPDATE
  get '/articles/:id/edit' do
    # match the id to show
    @article = Article.find(params[:id])
    erb :"articles/edit"
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
    end

  # DELETE
  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end
end
