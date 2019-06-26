require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:user){ create(:user) }
  let(:tweet){ user.tweets.build(content: 'Hello Rspec', user_id: user.id) }
  let!(:orange){ create(:orange) }
  let!(:tau_manifesto){ create(:tau_manifesto) }
  let!(:cat_video){ create(:cat_video) }
  let!(:most_recent){ create(:most_recent) }

  it "should be valid" do
    expect(tweet).to be_valid
  end

  it "is invalid without user_id" do
    user.id = nil
    expect(tweet).to_not be_valid
  end

  it "is invalid without content" do
    tweet.content = " "
    expect(tweet).to_not be_valid
  end

  context "content should have a maximum length" do
    it "is over 25 characters" do
      tweet.content = "a" * 26
      expect(tweet).to_not be_valid
    end

    it "is less than 25 characters " do
      tweet.content = "a" * 25
      expect(tweet).to be_valid
    end
  end

  it "shows most_recent as first order" do
    expect(most_recent).to eq Tweet.first
  end
end
