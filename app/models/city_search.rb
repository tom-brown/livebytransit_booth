class CitySearch < ApplicationRecord
  # Direct associations

  belongs_to :city

  belongs_to :search

  # Indirect associations

  # Validations

end
