class Admin::AnalysesController < Admin::BaseController
  before_action :set_analysis, except: [:index, :new, :sort]

  # GET /analyses
  def index
    @analyses = Analysis.order(id: :asc).page(params[:page])
    set_meta_tags({
      title: "分析管理"
    })
  end

  # GET /analyses/1
  def show
  end

  # GET /analyses/new
  def new
    @analysis = Analysis.new
    set_meta_tags({
      title: "新增分析"
    })
  end

  # GET /analyses/1/edit
  def edit
    set_meta_tags({
      title: "編輯分析"
    })
  end

  # POST /analyses
  def create
    if @analysis.save
      redirect_to admin_analyses_url, notice: '分析建立成功'
    else
      render :new
    end
  end

  # PATCH/PUT /analyses/1
  def update
    if @analysis.update(analysis_params)
      redirect_to admin_analyses_url, notice: '分析更新成功'
    else
      render :edit
    end
  end

  # DELETE /analyses/1
  def destroy
    @analysis.destroy
    redirect_to admin_analyses_url, notice: '分析已刪除'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_analysis
    @analysis = params[:id] ? Analysis.find(params[:id]) : Analysis.new(analysis_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def analysis_params
    params.require(:analysis).permit(:title, :content, :image, :discourse_url, :mindmap_url, :no
      :youtube_url, :image, :image_cache, :remove_image, {problem_ids: []})
  end
end
