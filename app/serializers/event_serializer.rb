class EventSerializer < ActiveModel::Serializer

  attributes :id,:name, :location, :date, :time, :image_url,
                   :description, :musicgenres


  def image_url
    "http://10.0.2.2:3000"+object.imageurl.url
  end

  def time
    object.time.try(:strftime, '%H:%M')
  end

  def date
    object.date.try(:strftime, '%d/%m/%Y')
  end

end