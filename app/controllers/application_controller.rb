
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Hello and welcome to the Articles CRUD Lab"
  end


  ### CREATE
  get "/articles/new" do
    erb :new
  end

  post "/articles" do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  ### UPDATE
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    erb :show
  end

  ### DESTROY
  delete "/articles/:id/delete" do
    Article.find(params[:id]).delete
    redirect "/articles"
  end


  ### READ
  get "/articles" do
    erb :index
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end
end
