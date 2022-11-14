class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def show
    id = params[:id] # retrieve report ID from URI route
    @report = Report.find(id) # look up report by unique ID
    # will render app/views/reports/show.<extension> by default
  end

  def index
    @completed_checked = params[:show_complete]
    @emer_only_checked = params[:emer_only]
    if params[:problem_type].nil?
      params[:problem_type] = Hash.new
      params[:problem_type][:problem_type] = "All"
    end
    @selected = params[:problem_type][:problem_type]
      

    @problemlist = Report.problemlist.prepend("All")

    @reports = Report.where(status: "Uncompleted")

    if !params[:show_complete].nil?
      @reports = Report
    end

    if !params[:emer_only].nil?
      @reports = @reports.where(emergencylevel: "Urgent")
    end

    if @reports == Report
      @reports = Report.all
    end

    if !params[:problem_type].nil? && params[:problem_type][:problem_type] != "All"
      @reports = @reports.where(problemtype: params[:problem_type][:problem_type])
    end

    session[:emer_only]=params[:emer_only]
    session[:show_complete] = params[:show_complete]
  end

  def new
    @problemlist = Report.problemlist
    @prefilled_building = ''
    @prefilled_area = ''
    if params[:report] != nil
      building = params[:report][:building]
      area = params[:report][:area]
      @prefilled_building = building if building != nil
      @prefilled_area = area if area != nil
    end
  end

  def create
    if ReportsHelper.valid_uni?(report_params[:uni])
      flash[:notice] = Report.check_and_create(report_params)
    else
      flash[:notice] = "invalid UNI"
    end

    redirect_to root_path
  end

  def edit
    @report = Report.find params[:id]
  end

  def complete
    report = Report.find params[:id]
    flash[:notice] = "Marked as complete successful"
    report.status = "Completed"
    report.save
    redirect_to report_path(report)
  end

  def addcmt
    report = Report.find params[:id]
    if params[:comment][:cmt].blank?
      flash[:notice] = "Cannot add a blank comment"
    else 
      flash[:notice] = "Comment successfully added"
      report.comments.build(:comment => params[:comment][:cmt], :manager_id=>session[:manager_id])
      report.save
    end 
    redirect_to report_path(report)
  end

  def update
    @report = Report.find params[:id]
    @report.update_attributes!(report_params)
    flash[:notice] = "#{@report.id} was successfully updated."
    redirect_to report_path(@report)
  end

  def destroy
    # @report = Report.find(params[:id])
    # @report.destroy
    # flash[:notice] = "Report '#{@report.id}' completed."
    # redirect_to reports_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def report_params
    params.require(:report).permit(:building, :area, :problemtype, :emergencylevel, :uni, :description, :file)
  end
end
