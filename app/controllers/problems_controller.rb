class ProblemsController < ApplicationController
  before_action :set_problem
  def vote
    if current_user
      puts current_user.to_json
      puts @problem.to_json
      vote = Vote.where(problem_id: @problem.id).where(user_id: current_user.id).first
      if vote.blank?
        vote = Vote.create(problem_id: @problem.id, user_id: current_user.id)
        render json: {
          votes_count: @problem.votes_count,
          voted: true,
          status: 'success'
        }
      else
        render json: {
          votes_count: @problem.votes_count,
          voted: true,
          message: 'already voted',
          status: 'failed'
        }
      end
    else
      render json: {
        votes_count: @problem.votes_count,
        message: 'not log in',
        status: 'failed'
      }
    end
  end

  def unvote
    if current_user
      vote = Vote.where("problem_id = #{@problem.id}").where("user_id = #{current_user.id}").first
      if vote.present?
        vote.destroy
        render json: {
          votes_count: @problem.votes_count,
          voted: false,
          status: 'success'
        }
      else
        render json: {
          votes_count: @problem.votes_count,
          voted: false,
          message: 'vote not found',
          status: 'failed'
        }
      end
    else
      render json: {
        votes_count: @problem.votes_count,
        message: 'not log in',
        status: 'failed'
      }
    end
  end

  private

  def set_problem
    @problem = params[:id] ? Problem.find(params[:id]) : Problem.new(problem_params)
  end

  def problem_params
    params.require(:problem).permit(:vote)
  end

end

