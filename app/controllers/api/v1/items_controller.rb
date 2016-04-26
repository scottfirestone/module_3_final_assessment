class Api::V1::ItemsController < ApplicationController
  respond_to :json
  protect_from_forgery with: :null_session, only: [:destroy]

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    item = Item.new(
      name: params["name"],
      description: params["description"],
      image_url: params["image_url"]
    )
    if item.save
      respond_with Item.last
    else
      render text: "You done messed up"
    end
  end

  def destroy
    respond_with Item.find(params[:id]).destroy
  end
end
