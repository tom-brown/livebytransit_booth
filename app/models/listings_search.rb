class ListingsSearch < ApplicationRecord
  # Direct associations

  belongs_to :search

  belongs_to :listing

  # Indirect associations

  # Validations

end
