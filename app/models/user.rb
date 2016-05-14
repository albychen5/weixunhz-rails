class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :username, presence: true, length: { minimum: 3, maximum: 16 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_attached_file :avatar, styles: { medium: '152x152#' }  
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
