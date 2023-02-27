require 'rails_helper'

describe Api::V1::UsersController do
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect {
          post :create, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }
        }.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post :create, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(api_v1_user_url(User.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new user' do
        post :create, params: { user: { name: '', email: 'invalid', password: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Jane Doe' } }

      it 'updates the requested user' do
        user = User.create!(name: 'John Doe', email: 'john@example.com', password: 'password')
        put :update, params: { id: user.to_param, user: new_attributes }
        user.reload
        expect(user.name).to eq('Jane Doe')
      end

      it 'renders a JSON response with the updated user' do
        user = User.create!(name: 'John Doe', email: 'john@example.com', password: 'password')
        put :update, params: { id: user.to_param, user: new_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the updated user' do
        user = User.create!(name: 'John Doe', email: 'john@example.com', password: 'password')
        put :update, params: { id: user.to_param, user: { name: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

