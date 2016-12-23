class Message < ApplicationRecord

  belongs_to :user

  has_many :comments, :dependent => :destroy

  has_many :likes
  has_many :liked_users, :through => :likes, :source => "user"

  has_many :subscribes
  has_many :subscribed_users, :through => :subscribes, :class_name => "subscribe"
  
  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where(:status => "completed") }
  scope :within_days, ->(date) { where(["created_at >= ?", Time.now - date ]) }

  
end
