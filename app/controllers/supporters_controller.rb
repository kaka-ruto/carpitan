class SupportersController < ApplicationController
  before_action :set_event
  before_action :set_supporter, only: %i[show edit update destroy]

  def index
    @supporters = @event.supporters
  end

  def show
  end

  def new
    @supporter = @event.supporters.build
  end

  def edit
  end

  def create
    @supporter = @event.supporters.build(supporter_params)
    if @supporter.save
      redirect_to event_supporter_path(@event, @supporter), notice: "Supporter was successfully created."
    else
      render :new
    end
  end

  def update
    if @supporter.update(supporter_params)
      redirect_to event_supporter_path(@event, @supporter), notice: "Supporter was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @supporter.destroy
    redirect_to event_supporters_path(@event), notice: "Supporter was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_supporter
    @supporter = @event.supporters.find(params[:id])
  end

  def supporter_params
    params.require(:supporter).permit(:name, :contact_info, :role, :category)
  end
end
