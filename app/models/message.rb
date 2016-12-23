class Message < ApplicationRecord

  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  scope :pending, -> { where( :status => "pending" ) }
  scope :completed, -> { where(:status => "completed") }
  scope :within_days, ->(date) { where(["created_at >= ?", Time.now - date ]) }

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
  	resources :topics
	end
end
