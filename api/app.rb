module AppServer
  class Api < Grape::API
    format :json

    get '/posts' do
      Post.all
    end

  end
end
