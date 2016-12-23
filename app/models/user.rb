class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages ,:dependent => :destroy
  has_many :comments ,:dependent => :destroy

  has_many :likes, :dependent => :destroy
  has_many :liked_messages, :through => :likes, :source => :message  

  has_many :subscribes, :dependent => :destroy
  has_many :subscribed_messages, :through => :subscribes, :source => :message        

  def display_name
    self.email.split("@").first
  end

  def posts_count
    # TODO: 請完成我
    count = 0

    count += self.messages.size if self.messages
    count += self.comments.size if self.comments

    return count
  end

  def words_count
    count = 0
    self.messages.find_each do |x|
      count += x.title.split(" ").size if x.title
      count += x.content.split(" ").size if x.content
    end

    self.comments.find_each do |x|
      count += x.content.split(" ").size if x.content
    end

    return count
  end

end
