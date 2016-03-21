class Recipe < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :chef

  validates_presence_of :name
  validates_presence_of :by
  validates_presence_of :description
  validates_presence_of :directions
  validates_presence_of :ingredients
  validates_presence_of :source
end