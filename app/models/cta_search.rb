class CtaSearch < ApplicationRecord
  # Direct associations

  belongs_to :cta_station

  belongs_to :search

  # Indirect associations

  # Validations

end
