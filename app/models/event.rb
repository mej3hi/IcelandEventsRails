class Event < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true

  validates :name, presence: true,
                   length: { maximum: 64 }

  validates :location, presence: true,
                       length: { maximum: 64 }

  validates :date, presence: true

  validates :time, presence: true

  validates :description, presence: true,
                          length: { maximum: 250 }

  validates :musicgenres, presence: true,
                          length: { maximum: 64 }

  mount_uploader :imageurl, ImageUploader

  validates_presence_of :imageurl

  validate :image_size_validation


  #---------leid 1 -------------
  #def image_url_path
   # imageurl.url
  #end

  #def format_time
   # time.try(:strftime, '%H:%M')
  #end
  #------------------------------

  private

  def image_size_validation
    errors[:imageurl] << 'should be less than 500KB' if imageurl.size > 0.5.megabytes
  end



end
