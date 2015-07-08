# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  post_id    :integer
#

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end
