class ResortController < ApplicationController
  def index
    @resorts = Resorts.all
  end
end
