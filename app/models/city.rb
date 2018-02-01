class City < ApplicationRecord
  # Direct associations

  has_many   :listings,
             :dependent => :destroy

  has_many   :city_searches,
             :dependent => :destroy

  has_many   :neighborhoods,
             :dependent => :nullify

  # Indirect associations

  has_many   :searches,
             :through => :city_searches,
             :source => :search

  # Validations

end
