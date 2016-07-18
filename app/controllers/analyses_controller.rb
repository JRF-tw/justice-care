class AnalysesController < ApplicationController
  before_action :set_analysis
  def show
    set_meta_tags({
      title: @analysis.title,
      description: display_shorter(@analysis.content, 100),
      keywords: '司法改革,全民司法改革運動,全民司改運動,民間司改會',
      og: {
        type: 'article',
        title: @analysis.title,
        description: display_shorter(@analysis.content, 100)
      },
      article: {
        author: Setting.url.fb,
        publisher: Setting.url.fb,
        published_time: @analysis.created_at.strftime('%FT%T%:z'),
        modified_time: @analysis.updated_at.strftime('%FT%T%:z')
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

