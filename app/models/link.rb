class Link < ApplicationRecord

  # Associations
  has_many :impressions, dependent: :destroy
  
  # Validations
  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug
  
  # Callbcks
  before_validation :generate_slug
    
  def generate_slug
    self.slug = SecureRandom.uuid[0..4] if self.slug.blank?
    true
  end
  
  def short
    Rails.application.routes.url_helpers.short_url(slug: self.slug)
  end  
  
  #TODO: Are we gonna delete completely or will mark them expired by a boolean field?
  # expire links that are created 30 days ago
  # for now marking them expired without deleting from db
  def self.expire_links
    links = Link.where("created_at < ?", 30.days.ago)
    links.update_all(expired: true, expired_at: DateTime.now)
  end
  
end
