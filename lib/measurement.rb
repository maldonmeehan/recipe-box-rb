require('pry')

class Measurement < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
end
