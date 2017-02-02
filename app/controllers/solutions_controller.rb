class SolutionsController < ApplicationController
  before_action :set_solution
  def show
    set_meta_tags({
      title: @solution.title,
      description: display_shorter(@solution.content, 150),
      keywords: '司法改革,全民司法改革運動,全民司改運動,民間司改會',
      og: {
        type: 'article',
        title: @solution.title,
        description: display_shorter(@solution.content, 150)
      },
      article: {
        author: Setting.url.fb,
        publisher: Setting.url.fb,
        published_time: @solution.created_at.strftime('%FT%T%:z'),
        modified_time: @solution.updated_at.strftime('%FT%T%:z')
      }
    })
  end

  private

  def set_solution
    @solution = params[:id] ? Solution.find(params[:id]) : Solution.new(solution_params)
  end

  def solution_params
    params.require(:solution).permit()
  end

end

