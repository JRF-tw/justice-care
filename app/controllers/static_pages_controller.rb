class StaticPagesController < ApplicationController
  def home
    
  end

  def step1
    @problems = Problem.all
  end

  def step2
  end

  def step3
  end
end
