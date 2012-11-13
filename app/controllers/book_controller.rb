require 'pry'

class BookController < ApplicationController
  def index
  end

  def create
    render :text => 'hello world'
  end
end
