class Snack < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :price

  has_many :machines
  #I know I need to make a many to many relationship.  Timed out.
end
