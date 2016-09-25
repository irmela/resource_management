require 'rails_helper'

RSpec.describe JobsController, :type => :controller do

  describe "anonymous access" do
    describe 'GET #new' do
      it "requires login" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "POST #create" do
      it "requires login" do
        post :create, job: FactoryGirl.attributes_for(:job)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it "requires login" do
        get :edit, id: FactoryGirl.create(:job)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "PATCH #update" do
      it "requires login" do
        patch :update, id: FactoryGirl.create(:job), job: FactoryGirl.attributes_for(:job)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "DELETE #destroy" do
      it "requires login" do
        delete :destroy, id: FactoryGirl.create(:job)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
