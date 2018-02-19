class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :doorkeeper_authorize! ,except: [:get_client]
  
  def liste_article
    render json: Article.getAllArticleWithCategory.to_json(include: [:comments , :tags])
  end

  def creer_article
    Article.create titre: params[:titre], category_id: params[:categoryId]
    render json: {state: "succes"}
  end

  def get_client
    client = Doorkeeper::Application.last
    render json: {
        url: "http://localhost:3000/oauth/authorize?client_id=#{client.uid}&redirect_uri=#{client.redirect_uri}&response_type=code",
        client_id: "#{client.uid}",
        client_secret: "#{client.secret}"
    }
  end
end
