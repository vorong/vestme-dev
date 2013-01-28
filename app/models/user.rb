# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	attr_accessible :email

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@microsoft\.com\z/i
	
	before_save { |user| user.email = email.downcase }

	validates :email, presence: true,
					uniqueness: { case_sensitive: false },
					format: { with: VALID_EMAIL_REGEX }
end
