class StaticPagesController < ApplicationController
  def home
    
  end

  def step1
    if params[:order] == 'hot'
      @problems = Problem.hot_order.page(params[:page])
    elsif params[:order] == 'lastest'
      @problems = Problem.lastest_order.page(params[:page])
    else
      @problems = Problem.votes_order.page(params[:page])
    end
  end

  def step2
  end

  def step3
  end
end
