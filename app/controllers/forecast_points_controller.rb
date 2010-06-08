class ForecastPointsController < ApplicationController
  # GET /forecast_points
  # GET /forecast_points.xml
  before_filter :login_required
  
  def index
    @forecast_points = ForecastPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forecast_points }
    end
  end

  # GET /forecast_points/1
  # GET /forecast_points/1.xml
  def show
    @forecast_point = ForecastPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forecast_point }
    end
  end

  # GET /forecast_points/new
  # GET /forecast_points/new.xml
  def new
    @forecast_point = ForecastPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forecast_point }
    end
  end

  # GET /forecast_points/1/edit
  def edit
    @forecast_point = ForecastPoint.find(params[:id])
  end

  # POST /forecast_points
  # POST /forecast_points.xml
  def create
    @forecast_point = ForecastPoint.new(params[:forecast_point])

    respond_to do |format|
      if @forecast_point.save
        flash[:notice] = 'ForecastPoint was successfully created.'
        format.html { redirect_to(:action => "index") }
        format.xml  { render :xml => @forecast_point, :status => :created, :location => @forecast_point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forecast_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forecast_points/1
  # PUT /forecast_points/1.xml
  def update
    @forecast_point = ForecastPoint.find(params[:id])

    respond_to do |format|
      if @forecast_point.update_attributes(params[:forecast_point])
        flash[:notice] = 'ForecastPoint was successfully updated.'
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forecast_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forecast_points/1
  # DELETE /forecast_points/1.xml
  def destroy
    @forecast_point = ForecastPoint.find(params[:id])
    @forecast_point.destroy

    respond_to do |format|
      format.html { redirect_to(forecast_points_url) }
      format.xml  { head :ok }
    end
  end

  def login_required

    if !session[:id]
      
      authenticate_or_request_with_http_basic do |username, password|
        user = User.find_by_username(username)        
        
        if user and user.password_matches?(password)
          session[:id] = user.id        
          true
        else
          false
        end
      end
    end
  end

end
