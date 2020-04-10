class Comment < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :dependent => :destroy

  belongs_to :article

  # Indirect associations

  # Validations

end
