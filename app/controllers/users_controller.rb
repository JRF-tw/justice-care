class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def update
    if @user.update(user_params)
      redirect_to step1_path(anchor: 'problem'), notice: '成功註冊'
    else
      render :edit
    end
  end

  def edit
    set_meta_tags({
      title: '修改法律背景',
      description: '',
      keywords: '',
      og: {
        type: 'website',
        title: '修改法律背景',
        description: ''
      }
    })
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:is_legal_profession)
  end
end