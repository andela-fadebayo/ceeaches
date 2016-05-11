class Comment < ActiveRecord::Base
  belongs_to :recipe

  validates_presence_of :name, :content, :recipe_id
end