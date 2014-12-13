# == Schema Information
#
# Table name: schemas
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  database_type  :string(255)
#  host           :string(255)
#  port           :string(255)
#  username       :string(255)
#  password       :string(255)
#  changelogtable :string(255)
#  application_id :integer
#  environment_id :integer
#  created_at     :datetime
#  updated_at     :datetime


class Schema < ActiveRecord::Base

	DATABASE_TYPES = ["mysql2", "postgresql"]

	validates :name, presence: true
	validates_inclusion_of :database_type, :in => %w(mysql2 postgresql)
	validates :host, presence: true
	validates :port, numericality: { only_integer: true }
	validates :username, presence: true
	validates :password, presence: true
	validates :changelogfile, presence: true
	validates :changelogtable, presence: true
	validates :application_id, presence: true
	validates :environment_id, presence: true
end
