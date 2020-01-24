require 'rails_helper'

RSpec.describe Retweet, type: :model do
  let(:retweet){ create(:retweet) }

  it "should be valid" do
    expect(retweet).to be_valid
  end

  it "should be invalid without user_id" do
    retweet.user_id = nil
    expect(retweet).to_not be_valid
  end

  it "should be invalid without tweet_id" do
    retweet.tweet_id = nil
    expect(retweet).to_not be_valid
  end
end
