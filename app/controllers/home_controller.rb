class HomeController < ApplicationController
  def index
    @businesses = Business.all
  end

  def terms
  end

  def privacy
  end
end
