# == Schema Information
#
# Table name: schemas
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  changelogtable :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  environment_id :integer
#  host           :string(255)
#  application_id :integer
#  database_type  :string(255)
#  username       :string(255)
#  password       :string(255)
#

require 'test_helper'

class SchemaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
