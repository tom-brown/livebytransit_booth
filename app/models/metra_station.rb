class MetraStation < ApplicationRecord
  # Direct associations

  has_many   :metra_searches,
             :dependent => :destroy

  has_many   :metra_assigns,
             :dependent => :destroy

  # Indirect associations

  has_many   :metra_lines,
             :through => :metra_assigns,
             :source => :metra_line

  has_many   :searches,
             :through => :metra_searches,
             :source => :search

  # Validations

end
