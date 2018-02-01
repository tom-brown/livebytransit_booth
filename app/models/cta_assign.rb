class CtaAssign < ApplicationRecord
  # Direct associations

  belongs_to :cta_station

  belongs_to :cta_line

  # Indirect associations

  # Validations

end
