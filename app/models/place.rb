class Place < ApplicationRecord
  has_many :entries, dependent: :destroy  # Ensures place can have multiple entries
end