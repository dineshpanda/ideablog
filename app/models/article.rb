class Article < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  has_many   :photos,
             :through => :comments,
             :source => :photos

  # Validations

end
