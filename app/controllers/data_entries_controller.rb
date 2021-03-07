class DataEntriesController < ApplicationController
  before_action :set_app
  before_action :set_dataset

  # GET /data_entries or /data_entries.json
  def index
    @data_entries = DataEntry.where(id: @dataset.entries.map{ |e| e['_id'] })
  end

  # POST /data_entries or /data_entries.json
  def create
    @data_entry = @dataset.data_entries.build(data_entry_params)

    respond_to do |format|
      if @data_entry.save
        format.turbo_stream { redirect_to app_dataset_data_entries_path(@app, @dataset) }
        format.html { redirect_to @data_entry, notice: "Data entry was successfully created." }
        format.json { render :show, status: :created, location: @data_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @data_entry.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_entry
      @data_entry = Dataentry.find(params[:id])
    end

    def set_app
      @app = App.find(params[:app_id])
    end

    def set_dataset
      @dataset = @app.datasets.find(params[:dataset_id])
    end

    # Only allow a list of trusted parameters through.
    def data_entry_params
      params.require(:data_entry).permit(:dataset_id, :name, :type)
    end
end
