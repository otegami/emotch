require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user){ create(:user) }
  context "when user is destroyed" do
    it "destoryed its tweet too" do
      user.tweets.create!(content: "Lorem ipsum")
      expect{ user.destroy }.to change { Tweet.count }.from(1).to(0)
    end
  end
end
