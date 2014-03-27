class Api::V1::FeedsController < ApplicationController
  respond_to :json

  def index
    respond_with Feed.order('created_at DESC')
  end
end
