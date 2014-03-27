class Api::V1::FeedsController < ApplicationController
  respond_to :json

  def index
    respond_with Feed.all
  end
end
