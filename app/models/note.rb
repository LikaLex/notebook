class Note < ApplicationRecord
  searchkick
  belongs_to :user
  belongs_to :status
end
