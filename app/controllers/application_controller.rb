require "pry"
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#index action
  get '/articles' do
    @articles = Article.all
    erb :index
  end

#new action
  get '/articles/new' do
    erb :new
  end

#show action
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article[:id]}"
  end

#edit action
  get '/articles/:id/edit' do
    @articles = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @articles = Article.find(params[:id])
    @articles.update(title: params[:title], content: params[:content])
    erb :show
  end

#delete action
  delete "/articles/:id" do
    @articles = Article.find(params[:id])
    @articles.destroy
    redirect '/articles'
  end

end
