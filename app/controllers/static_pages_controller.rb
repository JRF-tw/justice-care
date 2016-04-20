class StaticPagesController < ApplicationController
  def home
    
  end

  def step1
    if params[:sort] == 'hot'
      @problems = Problem.hot_order.page(params[:page])
    elsif params[:sort] == 'lastest'
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
