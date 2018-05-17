class Note < ApplicationRecord
  searchkick highlight: [:title, :status]
  belongs_to :user
  belongs_to :status
end
