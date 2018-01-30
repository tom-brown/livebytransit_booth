class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :listing

  # Indirect associations

  # Validations

end
