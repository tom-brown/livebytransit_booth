class User < ApplicationRecord
  # Direct associations

  has_many   :listings,
             :dependent => :nullify

  has_many   :contacts,
             :dependent => :destroy

  has_many   :showings,
             :dependent => :destroy

  has_many   :favorites,
             :dependent => :destroy

  has_many   :searches,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
