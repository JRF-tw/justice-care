class Admin::ReportsController < Admin::BaseController
  before_action :find_analysis
  before_action :set_report, except: [:index, :new, :sort]

  # GET /reports
  def index
    @reports = @analysis.reports.order(id: :asc).page(params[:page])
    set_meta_tags({
      title: "報告管理",
      og: {
        title: "報告管理"
      }
    })
  end

  # GET /reports/1
  def show
  end

  # GET /reports/new
  def new
    @report = @analysis.reports.new
    set_meta_tags({
      title: "新增報告",
      og: {
        title: "新增報告"
      }
    })
  end

  # GET /reports/1/edit
  def edit
    set_meta_tags({
      title: "編輯報告",
      og: {
        title: "編輯報告"
      }
    })
  end

  # POST /reports
  def create
    if @report.save
      redirect_to admin_analysis_reports_url, notice: '報告建立成功'
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to admin_analysis_reports_url, notice: '報告更新成功'
    else
      render :edit
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to admin_analysis_reports_url, notice: '報告已刪除'
  end

  private

  def find_analysis
    @analysis = Analysis.find(params[:analysis_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = params[:id] ? Report.find(params[:id]) : Report.new(report_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:analysis_id, :title, :content, :no, :discourse_url, :mindmap_url)
  end
end
