require_relative 'modules/header'

class HomepageController < ApplicationController
  include HeaderGenerator

  def index
    @header = generate_header
    render :index
  end
end
