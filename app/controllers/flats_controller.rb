require "open-uri"

class FlatsController < ApplicationController

  def index
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"

    if params[:max_price].blank?
      @flats = JSON.parse(open(url).read)
    else
      @flats = JSON.parse(open(url).read).select do |flat|
        flat['price'] <= params[:max_price].to_i && flat['id'] <= params[:max_id].to_i
      end
    end

  end

  def show

    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"

    @flat = JSON.parse(open(url).read).find do |flat|
      flat['id'] == params[:id].to_i
    end

  end


end

