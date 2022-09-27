require 'rails_helper'

RSpec.describe 'Users Endpoint' do
  describe 'Happy Path Sign Up' do
    it 'Posts a new user to the database' do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_params = {
        "username": 'ben@ben.com',
        "password": "ben123",
        "password_confirmation": "ben123"
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(result).to have_key(:data)
      data = result[:data]

      expect(data).to have_key(:type)
      expect(data[:type]).to eq("users")
      expect(data).to have_key(:id)
      expect(data[:id]).to be_a String
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a Hash
      expect(data[:attributes]).to have_key(:username)
      expect(data[:attributes]).to have_key(:api_key)
      expect(data[:attributes][:username]).to be_a String
      expect(data[:attributes][:api_key]).to be_a String

    end
  end

  describe 'sad path' do
    it 'fails to create user without email' do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_params = {
        "password": "ben123",
        "password_confirmation": "ben123"
      }

      post api_v1_users_path, headers: headers, params: user_params.to_json
      expect(User.count).to eq(0)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end

    it 'fails to create user without password' do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_params = {
        "username": 'ben@ben.com',
      }


      post api_v1_users_path, headers: headers, params: user_params.to_json
      expect(User.count).to eq(0)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end

    it 'fails to create user if password confirmation fails' do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_params = {
        "username": 'ben@ben.com',
        "password": "ben123",
        "password_confirmation": "321"
      }


      post api_v1_users_path, headers: headers, params: user_params.to_json
      expect(User.count).to eq(0)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end

    it 'fails to create user if no JSON body is sent' do
      user_params = {
        "username": 'ben@ben.com',
        "password": "ben123",
        "password_confirmation": "ben123"
      }

      post api_v1_users_path, params: user_params.to_json
      expect(User.count).to eq(0)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end

  end
end
