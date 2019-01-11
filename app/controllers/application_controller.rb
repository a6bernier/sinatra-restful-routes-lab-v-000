require './config/environment'

class ApplicationController < Sinatra::Base
  # register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    end

  # code actions here!

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  get '/recipes/:id' do  #loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end


end
