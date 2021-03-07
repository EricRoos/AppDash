class DataPointsController < ApplicationController
  before_action :set_app
  before_action :set_dataset
  before_action :set_data_point, only: %i[ show edit update destroy ]

  # GET /data_points or /data_points.json
  def index
    @data_points = @dataset.data_points.all
  end

  # GET /data_points/1 or /data_points/1.json
  def show
  end

  # GET /data_points/new
  def new
    @data_point = DataPoint.new
  end

  # GET /data_points/1/edit
  def edit
  end

  # POST /data_points or /data_points.json
  def create
    @data_point = @dataset.data_points.build(data_point_params)

    respond_to do |format|
      if @data_point.save
        format.turbo_stream { redirect_to app_dataset_data_points_path(@app, @dataset) }
        format.html { redirect_to @data_point, notice: "Data point was successfully created." }
        format.json { render :show, status: :created, location: @data_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_points/1 or /data_points/1.json
  def update
    respond_to do |format|
      if @data_point.update(data_point_params)
        format.html { redirect_to @data_point, notice: "Data point was successfully updated." }
        format.json { render :show, status: :ok, location: @data_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_points/1 or /data_points/1.json
  def destroy
    @data_point.destroy
    respond_to do |format|
      format.turbo_stream { redirect_to app_dataset_data_points_path(@app, @dataset) }
      format.html { redirect_to data_points_url, notice: "Data point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_point
      @data_point = DataPoint.find(params[:id])
    end

    def set_app
      @app = App.find(params[:app_id])
    end

    def set_dataset
      @dataset = @app.datasets.find(params[:dataset_id])
    end

    # Only allow a list of trusted parameters through.
    def data_point_params
      params.require(:data_point).permit(:dataset_id, :name, :type)
    end
end
