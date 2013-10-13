# -*- encoding : utf-8 -*-
class StaticPagesController < ApplicationController
  def home
  @news = News.last(3).reverse
  end

  def help
  end

  def contact
  end

  def about
  end
end
