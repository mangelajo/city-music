class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /events
  # GET /events.json
  def index
    authorize! :manage, :event if api_request?
    @events = Event.where(nil)
    @events = @events.filter_by_name(params[:name]) if params[:name].present?
    @events = @events.filter_by_venue_id(params[:venue_id]) if params[:venue_id].present?
    @events = @events.filter_by_source_url(params[:source_url]) if params[:source_url].present?
  end

  # GET /events/1
  # GET /events/1.json
  def show
    authorize! :manage, :event if api_request?
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    authorize! :create, :event
    @event = Event.new(event_params)

    @event.add_dates(params[:event_dates])
    @event.add_images(params[:images])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params) and @event.update_dates(params[:dates])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :venue_id, :description, :price_min, :price_max,
                                    :source_url, :tickets_urls, :video_url, :band_id, :images)
    end

end
