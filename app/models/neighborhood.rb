class Neighborhood < ApplicationRecord
  # Direct associations

  has_many   :hood_points,
             :dependent => :destroy

  has_many   :listings,
             :dependent => :nullify

  has_many   :hood_searches,
             :dependent => :destroy

  belongs_to :city

  # Indirect associations

  has_many   :searches,
             :through => :hood_searches,
             :source => :search

  # Validations

end
