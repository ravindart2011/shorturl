class Impression < ApplicationRecord
  
  # Associations
  belongs_to :link
  
  # Scopes
  scope :non_expired_links, -> { joins(:link).where(links: {expired: false}) }
end
