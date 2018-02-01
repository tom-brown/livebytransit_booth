class MetraSearch < ApplicationRecord
  # Direct associations

  belongs_to :metra_station

  belongs_to :search

  # Indirect associations

  # Validations

end
