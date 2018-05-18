class Note < ApplicationRecord
  searchkick highlight: [:title]
  belongs_to :user
  enum status: {draft: 1, ready_for_export: 2, exported: 3}

end
