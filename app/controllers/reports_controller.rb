class ReportsController < ApplicationController

  def show
    id = params[:id] # retrieve report ID from URI route
    @report = Report.find(id) # look up report by unique ID
    # will render app/views/reports/show.<extension> by default
  end

  def index
    if params[:emergency_sort].nil?
      session[:emergency_sort] = "1"
      redirect_to reports_path(:emergency_sort => session[:emergency_sort])
    end    
    
    if params[:emergency_sort] == "1"
      @reports = Report.order(emergencylevel: :asc)
      @emergency_sort = "0"
    else 
      @reports = Report.all
      @emergency_sort = "1"
    end

    session[:emergency_sort]=params[:emergency_sort]
  end

  def new
    # default: render 'new' template
  end

  def create
    if report_params[:uni].match?(/^[a-z][a-z][0-9][0-9][0-9][0-9]$/x)
      flash[:notice] = Report.check_and_create(report_params)
    else
      flash[:notice] = "invalid UNI"
    end
    redirect_to reports_path
  end

  def edit
    @report = Report.find params[:id]
  end

  def update
    @report = Report.find params[:id]
    @report.update_attributes!(report_params)
    flash[:notice] = "#{@report.id} was successfully updated."
    redirect_to report_path(@report)
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    flash[:notice] = "Report '#{@report.id}' completed."
    redirect_to reports_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def report_params
    params.require(:report).permit(:building, :area, :problemtype, :emergencylevel, :uni)
  end
end
