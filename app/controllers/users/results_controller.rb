class Users::ResultsController < ApplicationController
  before_action :authenticate_user!
  # before_action :get_event, except: %i[ index]
  before_action :set_result, only: %i[ show edit update destroy ]

  # GET /results or /results.json
  def index
    @results = Result.all
    @events = Event.where(event_status: "CLOSE")
  end

  # GET /results/1 or /results/1.json
  def show
    @participants = Participant.where(event_id: params[:event_id])

    @event = Event.find(params[:id])
  end

  # GET /results/new
  def new
    @event = Event.all
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results or /results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to admin_results_path(@result), notice: "Result was successfully created." }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1 or /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to admin_results_path(@result), notice: "Result was successfully updated." }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1 or /results/1.json
  def destroy
    @result.destroy

    respond_to do |format|
      format.html { redirect_to admin_results_path, notice: "Result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_event
      @event = Event.find(params[:event_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @event = Event.find(params[:event_id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:result_description, :event_id, :user_id)
    end
end
