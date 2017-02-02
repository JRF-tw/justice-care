class Admin::SolutionsController < Admin::BaseController
  before_action :set_solution, except: [:index, :new, :sort]

  # GET /solutions
  def index
    @solutions = Solution.order(id: :asc).page(params[:page])
    set_meta_tags({
      title: "解法管理",
      og: {
        title: "解法管理"
      }
    })
  end

  # GET /solutions/1
  def show
  end

  # GET /solutions/new
  def new
    @solution = Solution.new
    set_meta_tags({
      title: "新增解法",
      og: {
        title: "新增解法"
      }
    })
  end

  # GET /solutions/1/edit
  def edit
    set_meta_tags({
      title: "編輯解法",
      og: {
        title: "編輯解法"
      }
    })
  end

  # POST /solutions
  def create
    if @solution.save
      redirect_to admin_solutions_url, notice: '解法建立成功'
    else
      render :new
    end
  end

  # PATCH/PUT /solutions/1
  def update
    if @solution.update(solution_params)
      redirect_to admin_solutions_url, notice: '解法更新成功'
    else
      render :edit
    end
  end

  # DELETE /solutions/1
  def destroy
    @solution.destroy
    redirect_to admin_solutions_url, notice: '解法已刪除'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_solution
    @solution = params[:id] ? Solution.find(params[:id]) : Solution.new(solution_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def solution_params
    params.require(:solution).permit(:title, :content, :no, :discourse_url, {problem_ids: []})
  end
end
