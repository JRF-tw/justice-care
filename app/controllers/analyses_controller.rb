class AnalysesController < ApplicationController
  before_action :set_analysis
  def show
    set_meta_tags({
      title: @analysis.title,
      description: "#{@analysis.title}分析報告",
      keywords: '司法改革,全民司法改革運動,全民司改運動,民間司改會',
      og: {
        type: 'article',
        title: @analysis.title,
        description: "#{@analysis.title}分析報告"
      }
    })
  end

  private

  def set_analysis
    @analysis = params[:id] ? Analysis.find(params[:id]) : Analysis.new(analysis_params)
  end

  def analysis_params
    params.require(:analysis).permit()
  end

end

