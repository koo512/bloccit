# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  value      :integer
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'
include TestFactories

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do

        vote1 = Vote.new(value: 1)
        expect(vote1.valid?).to eq(true)

        vote2 = Vote.new(value: -1)
        expect(vote2.valid?).to eq(true)

        vote3 = Vote.new(value: 5)
        expect(vote3.valid?).to eq(false)
        
      end
    end
  end

  describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end
 end
