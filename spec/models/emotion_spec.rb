require 'rails_helper'

RSpec.describe Emotion, type: :model do
  let(:emotion){ create(:emotion) }

  it "should be valid" do
    expect(emotion).to be_valid
  end

  it "should be invalid without user_id" do
    emotion.user_id = nil
    expect(emotion).to_not be_valid
  end

  it "should be invalid without tweet_id" do
    emotion.tweet_id = nil
    expect(emotion).to_not be_valid
  end

  it "create emo and unemo a tweet by user" do
    user = create(:user)
    tweet = create(:tweet)
    expect(user.emo?(tweet)).to_not be_truthy
    user.emo(tweet)
    expect(user.emo?(tweet)).to be_truthy
    user.unemo(tweet)
    expect(user.emo?(tweet)).to_not be_truthy
  end
end
