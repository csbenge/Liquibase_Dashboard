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

require 'test_helper'

class EnvironmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
