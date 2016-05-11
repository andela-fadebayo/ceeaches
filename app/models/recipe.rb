class Recipe < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :chef

  validates_presence_of :name, :by, :description, :directions, :ingredients, :source
end