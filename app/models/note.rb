class Note < ApplicationRecord
  searchkick
  belongs_to :user
end
