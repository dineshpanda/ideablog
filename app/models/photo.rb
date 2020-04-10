class Photo < ApplicationRecord
  # Direct associations

  belongs_to :comment

  # Indirect associations

  has_one    :article,
             :through => :comment,
             :source => :article

  # Validations

end
