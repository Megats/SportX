class Admins::CollabsController < ApplicationController
  before_action :set_collab, only: %i[ show edit update destroy ]

  # GET /collabs or /collabs.json
  def index
    @collabs = Collab.all
  end

  # GET /collabs/1 or /collabs/1.json
  def show
  end

  # GET /collabs/new
  def new
    @collab = Collab.new
  end

  # GET /collabs/1/edit
  def edit
  end

  # POST /collabs or /collabs.json
  def create
    @collab = Collab.new(collab_params)

    respond_to do |format|
      if @collab.save
        format.html { redirect_to admin_collab_url(@collab), notice: "Collab was successfully created." }
        format.json { render :show, status: :created, location: @collab }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collabs/1 or /collabs/1.json
  def update
    respond_to do |format|
      if @collab.update(collab_params)
        format.html { redirect_to admin_collab_url(@collab), notice: "Collab was successfully updated." }
        format.json { render :show, status: :ok, location: @collab }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collabs/1 or /collabs/1.json
  def destroy
    @collab.destroy

    respond_to do |format|
      format.html { redirect_to admin_collabs_url, notice: "Collab was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collab
      @collab = Collab.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collab_params
      params.require(:collab).permit(:collab_name, :collab_organiser, :collab_contact, :collab_email, :collab_website)
    end
end
