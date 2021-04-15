class StaticController < ApplicationController
  def Pages
  end

  def home
  end

  def help
  end

  def about
    render html "Hello World!"
  end
end
