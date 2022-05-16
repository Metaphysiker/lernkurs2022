class Slide < ApplicationRecord
  belongs_to :course, optional: true
end
