class Article < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
