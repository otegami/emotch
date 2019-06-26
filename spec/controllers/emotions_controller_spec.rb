require 'rails_helper'

RSpec.describe EmotionsController, type: :controller do
  describe 'POST create' do
    context "with user who not logged in" do
      it " redirects to home page " do
        expect{
          post :create, params: { tweet_id: 1, user_id: 2 }
        }.to change{ Emotion.count }.by(0)
        expect(response).to redirect_to(root_path)
      end
    end
  end
  describe 'Delete destroy' do
    before :each do
      @emotion = create(:emotion)
    end
    context "with user who not logged in" do
      it " deletes the tweet" do
        expect{
          delete :destroy, params: { id: @emotion.id }
        }.to change{ Emotion.count }.by(0)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
