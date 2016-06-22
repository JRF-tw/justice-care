class AnalysissController < ApplicationController
  before_action :set_analysis
  def show
  end

  private

  def set_analysis
    @analysis = params[:id] ? Analysis.find(params[:id]) : Analysis.new(analysis_params)
  end

  def analysis_params
    params.require(:analysis).permit()
  end

end

