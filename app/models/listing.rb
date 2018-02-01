class Listing < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood,
             :required => false

  belongs_to :city

  belongs_to :user,
             :required => false,
             :counter_cache => true

  has_many   :listings_searches,
             :dependent => :destroy

  has_many   :showings,
             :dependent => :destroy

  has_many   :favorites,
             :dependent => :destroy

  # Indirect associations

  has_many   :searches,
             :through => :listings_searches,
             :source => :search

  # Validations

end
