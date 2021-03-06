class Admin::ProblemsController < Admin::BaseController
  before_action :set_problem, except: [:index, :new, :sort]

  # GET /problems
  def index
    @problems = Problem.order(id: :asc).page(params[:page])
    set_meta_tags({
      title: "問題管理",
      og: {
        title: "問題管理"
      }
    })
  end

  # GET /problems/1
  def show
  end

  # GET /problems/new
  def new
    @problem = Problem.new
    set_meta_tags({
      title: "新增問題",
      og: {
        title: "新增問題"
      }
    })
  end

  # GET /problems/1/edit
  def edit
    set_meta_tags({
      title: "編輯問題",
      og: {
        title: "編輯問題"
      }
    })
  end

  # POST /problems
  def create
    if @problem.save
      redirect_to admin_problems_url, notice: '問題建立成功'
    else
      render :new
    end
  end

  # PATCH/PUT /problems/1
  def update
    if @problem.update(problem_params)
      redirect_to admin_problems_url, notice: '問題更新成功'
    else
      render :edit
    end
  end

  # DELETE /problems/1
  def destroy
    @problem.destroy
    redirect_to admin_problems_url, notice: '問題已刪除'
  end

  def sort
    problem_params[:order].each do |key,value|
      Problem.find(value[:id]).update_attribute(:position, value[:position])
    end
    render nothing: true
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_problem
    @problem = params[:id] ? Problem.find(params[:id]) : Problem.new(problem_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def problem_params
    params.require(:problem).permit(:title, :content, :add, :discourse_url, :status)
  end
end
