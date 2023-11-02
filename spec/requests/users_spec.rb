require 'rails_helper'

RSpec.describe Users::UsersController, type: :controller do
  before do
    @user = User.create(email: "atoz@gmail.com",password:"12345678", role: nil, name: "a1", 
    department: "development", address: "indore", BOD: "2004-10-30", age: 19)
    
    sign_in @user
  end
 describe 'GET #index' do
    it 'returns a JSON response with status 200' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response.content_type)== 'application/json'
    end
  end
end
