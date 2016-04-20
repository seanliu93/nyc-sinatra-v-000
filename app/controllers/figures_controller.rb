class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    if params["landmark"]["name"] != ""
      Landmark.create(params["landmark"])
      if params["figure"]["landmark_ids"] == nil
        params["figure"]["landmark_ids"] = [Landmark.last.id]
      else
        params["figure"]["landmark_ids"] << Landmark.last.id
      end
    end
    if params["title"]["name"] !=  ""
      Title.create(params["title"])
      if params["figure"]["title_ids"] == nil
        params["figure"]["title_ids"] = [Title.last.id]
      else
        params["figure"]["title_ids"] << Title.last.id
      end
    end
    #binding.pry
    Figure.create(params["figure"])
    redirect '/figures'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
   @figure = Figure.find(params[:id])
   @figure.name = params["figure"]["name"]
    if params["landmark"]["name"] != ""
      Landmark.create(params["landmark"])
      if params["figure"]["landmark_ids"] == nil
        params["figure"]["landmark_ids"] = [Landmark.last.id]
      else
        params["figure"]["landmark_ids"] << Landmark.last.id
      end
    end
    if params["title"]["name"] !=  ""
      Title.create(params["title"])
      if params["figure"]["title_ids"] == nil
        params["figure"]["title_ids"] = [Title.last.id]
      else
        params["figure"]["title_ids"] << Title.last.id
      end
    end
    @figure.title_ids = params["figure"]["title_ids"]
    @figure.landmark_ids = params["figure"]["landmark_ids"]
    @figure.save
   erb :'figures/show'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
end