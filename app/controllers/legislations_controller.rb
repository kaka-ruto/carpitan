class LegislationsController < ApplicationController
  before_action :set_legislation, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  # GET /legislations or /legislations.json
  def index
    @legislations = Legislation.all
  end

  # GET /legislations/1 or /legislations/1.json
  def show
  end

  # GET /legislations/new
  def new
    @legislation = current_user.legislations.build
  end

  # GET /legislations/1/edit
  def edit
  end

  # POST /legislations or /legislations.json
  def create
    @legislation = current_user.legislations.build(legislation_params)

    respond_to do |format|
      if @legislation.save
        format.html { redirect_to legislation_url(@legislation), notice: "Legislation was successfully created." }
        format.json { render :show, status: :created, location: @legislation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @legislation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legislations/1 or /legislations/1.json
  def update
    respond_to do |format|
      if @legislation.update(legislation_params)
        format.html { redirect_to legislation_url(@legislation), notice: "Legislation was successfully updated." }
        format.json { render :show, status: :ok, location: @legislation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @legislation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legislations/1 or /legislations/1.json
  def destroy
    @legislation.destroy!

    respond_to do |format|
      format.html { redirect_to legislations_url, notice: "Legislation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_legislation
    @legislation = Legislation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def legislation_params
    params.require(:legislation).permit(:title, :description, :status)
  end
end
