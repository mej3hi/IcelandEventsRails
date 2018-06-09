class Api::EventController < Api::ApiController

  def index
    render json: Event.take(6)
    end

  def my_events
    @events = current_user.event
  end

  def edit
    @events = current_user.event.find_by(id: params[:id])
  end

  def update
    #render plain: params.inspect
    @events = current_user.event.find_by(id: params[:id])
    if @events.update(event_params)
      redirect_to my_events_url
    else
      render 'edit'
    end
  end

  def new
    @events = Event.new
  end

  def create
    @events = current_user.event.build(event_params)
    if @events.save
      redirect_to my_events_url
    else
      render 'new'
    end
  end

  def destroy
    @events = current_user.event.find_by(id: params[:id])
    @events.destroy
    @events.remove_imageurl!
    redirect_to my_events_url
  end

  def calender
    @events = Event.where(data: params[:day])
    @date_now = params[:day]
    render 'index'
  end

  private

  def event_params
    params.require(:events).permit(:name, :location, :data, :time,
                                   :description, :musicgenres, :imageurl, :imageurl_cache)
  end





end