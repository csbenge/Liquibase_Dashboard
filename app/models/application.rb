# == Schema Information
#
# Table name: applications
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Application < ActiveRecord::Base
	has_many :environments
	has_many :schemas

	validates :name, presence: true
	validates :description, presence: true
end
