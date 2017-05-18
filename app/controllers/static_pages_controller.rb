class StaticPagesController < ApplicationController
  def home
    set_meta_tags({
      title: '全民司改運動',
      description: '若對台灣司法懷有期許和熱情，現在，就是你站出來的時候。跟我們一起做「全民司改運動」！',
      keywords: '司法改革,全民司法改革運動,全民司改運動,民間司改會',
      og: {
        type: 'website',
        title: '全民司改運動',
        description: '若對台灣司法懷有期許和熱情，現在，就是你站出來的時候。跟我們一起做「全民司改運動」！'
      }
    })
  end

  def step1
    if params[:sort] == 'lastest'
      @problems = Problem.lastest_order.page(params[:page])
    elsif params[:sort] == 'votes'
      @problems = Problem.votes_order.page(params[:page])
    elsif params[:sort] == '520votes'
      @problems = Problem.votes_order_before_520.page(params[:page])
    elsif params[:sort] == 'hot'
      @problems = Problem.hot_order.page(params[:page])
    else
      @problems = Problem.votes_order.page(params[:page])
    end
    @users_count = User.all.count
    set_meta_tags({
      title: '健康檢查',
      description: '你心中重要的問題是什麼？來投票吧！',
      keywords: '司法改革,全民司法改革運動,全民司改運動,民間司改會',
      og: {
        type: 'website',
        title: '健康檢查',
        description: '你心中重要的問題是什麼？來投票吧！'
      }
    })
  end

  def step2
    @problems = Problem.step2.votes_order.page(params[:page])
    set_meta_tags({
      title: '評估體能',
      description: '評估問題背後的成因',
      keywords: '司法改革,全民司法改革運動,全民司改運動,民間司改會',
      og: {
        type: 'website',
        title: '評估體能',
        description: '評估問題背後的成因'
      }
    })
  end

  def step3
    @problems = Problem.step3.votes_order.page(params[:page])
    set_meta_tags({
      title: '訓練項目',
      description: '對問題生成的體制因素討論解方',
      keywords: '司法改革,全民司法改革運動,全民司改運動,民間司改會',
      og: {
        type: 'website',
        title: '訓練項目',
        description: '對問題生成的體制因素討論解方'
      }
    })
  end
end
