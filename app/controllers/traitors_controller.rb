class TraitorsController < ApplicationController
  before_action :set_traitor, only: %i[show edit update destroy]
  before_action :set_event

  def index
    @traitors = @event.traitors
  end

  def show
  end

  def new
    @traitor = @event.traitors.build
  end

  def edit
  end

  def create
    @traitor = @event.traitors.build(traitor_params)
    if @traitor.save
      redirect_to event_traitor_path(@event, @traitor), notice: "Traitor was successfully created."
    else
      render :new
    end
  end

  def update
    if @traitor.update(traitor_params)
      redirect_to event_traitor_path(@event, @traitor), notice: "Traitor was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @traitor.destroy
    redirect_to event_traitors_path(@event), notice: "Traitor was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_traitor
    @traitor = Traitor.find(params[:id])
  end

  def traitor_params
    params.require(:traitor).permit(:name, :handles, :linked_tweet, :screenshot)
  end
end
