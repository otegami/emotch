require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe 'POST create' do
    context "with user who not logged in" do
      it " redirects to home page " do
        expect{
          post :create, params: { tweet: attributes_for(:tweet) }
        }.to change{ Tweet.count }.by(0)
        expect(response).to redirect_to(root_path)
      end
    end
  end
  describe 'Delete destroy' do
    before :each do
      @tweet = create(:tweet)
    end
    context "with user who not logged in" do
      it " deletes the tweet" do
        expect{
          delete :destroy, params: { id: @tweet.id }
        }.to change{ Tweet.count }.by(0)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
