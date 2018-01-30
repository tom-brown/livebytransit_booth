class CtaLine < ApplicationRecord
  # Direct associations

  has_many   :cta_assigns,
             :dependent => :destroy

  # Indirect associations

  has_many   :cta_stations,
             :through => :cta_assigns,
             :source => :cta_station

  # Validations

end
