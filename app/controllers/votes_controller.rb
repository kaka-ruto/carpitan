class VotesController < ApplicationController
  before_action :set_vote, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_legislation, only: %i[new create]

  # GET /votes or /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1 or /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = @legislation.votes.build
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes or /votes.json
  def create
    @vote = @legislation.votes.build(vote_params.merge(user: current_user))

    respond_to do |format|
      if @vote.save
        format.html { redirect_to legislation_vote_url(@vote.legislation, @vote), notice: "Vote was successfully created." }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1 or /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to legislation_vote_url(@vote.legislation, @vote), notice: "Vote was successfully updated." }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1 or /votes/1.json
  def destroy
    @vote.destroy!

    respond_to do |format|
      format.html { redirect_to legislation_path(@vote.legislation), notice: "Vote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_legislation
    @legislation = Legislation.find(params[:legislation_id])
  end

  # Only allow a list of trusted parameters through.
  def vote_params
    params.require(:vote).permit(:choice, :politician_id, :legislation_id)
  end
end
