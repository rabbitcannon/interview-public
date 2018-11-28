class Host < ActiveRecord::Base
  has_many :event
  validates_presence_of :name
end
