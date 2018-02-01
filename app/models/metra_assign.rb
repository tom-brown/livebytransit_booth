class MetraAssign < ApplicationRecord
  # Direct associations

  belongs_to :metra_station

  belongs_to :metra_line

  # Indirect associations

  # Validations

end
