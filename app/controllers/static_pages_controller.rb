class StaticPagesController < ApplicationController
  def home
    set_meta_tags({
      title: '首頁',
      description: '',
      keywords: '司法改革',
      og: {
        type: 'website',
        title: '首頁',
        description: ''
      }
    })
  end

  def step1
    if params[:sort] == 'hot'
      @problems = Problem.hot_order.page(params[:page])
    elsif params[:sort] == 'lastest'
      @problems = Problem.lastest_order.page(params[:page])
    else
      @problems = Problem.votes_order.page(params[:page])
    end
    set_meta_tags({
      title: '健康檢查',
      description: '你心中重要的問題是什麼？來投票吧！',
      keywords: '司法改革',
      og: {
        type: 'website',
        title: '健康檢查',
        description: '你心中重要的問題是什麼？來投票吧！'
      }
    })
  end

  def step2
    set_meta_tags({
      title: '評估體能',
      description: '',
      keywords: '司法改革',
      og: {
        type: 'website',
        title: '評估體能',
        description: ''
      }
    })
  end

  def step3
    set_meta_tags({
      title: '訓練項目',
      description: '',
      keywords: '司法改革',
      og: {
        type: 'website',
        title: '訓練項目',
        description: ''
      }
    })
  end
end
