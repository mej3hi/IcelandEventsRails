class Api::V1::EventController < Api::V1::ApiController

  skip_before_action :authenticate_request, only: [:index, :calender]

  def index

    # Nota AMS (serializers/event_serializer)
    render json: Event.take(6)

    #----leið 2 með jbuilder ( views/api/v1/event/index )
    #@Events = Event.take(6)
    #render "index.json.jbuilder"

    #-------------leið 1 án jbuilder og AMS (methods eru í event.rb)
    #render json: Event.take(6).as_json(except: [:imageurl,:time,:created_at,:updated_at],
                                                #methods: [:image_url_path, :format_time])

  end

  def my_events
    render json: current_user.event
  end

  def update
    event = current_user.event.find_by(id: params[:id])
    if event.update(event_params)
      render status: 200, json: 'Successfully updated'.to_json
    else
      render status: 422, json: { errors: event.errors }
    end
  end

  def create
    event = current_user.event.build(event_params)
    if event.save
      render status: 200, json: 'Successfully create'.to_json
    else
      render status: 422, json: { errors: event.errors }
    end
  end

  def destroy
    event = current_user.event.find_by(id: params[:id])
    event.destroy
    event.remove_imageurl!
    render status: 200, json: 'Successfully remove'.to_json
  end

  def calender
    events = Event.where(date: params[:day])
    render json: events
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :time,
                                   :description, :musicgenres, :imageurl)
  end


end