# == Schema Information
#
# Table name: environments
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :string(255)
#  application_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Environment < ActiveRecord::Base
  belongs_to :application
  has_many :schemas

  validates :name, presence: true
  validates :description, presence: true
  validates :application_id, presence: true
end
