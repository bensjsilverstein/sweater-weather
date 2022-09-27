require 'rails_helper'

  describe 'Session creation' do

    describe 'happy path' do
      it 'successfully creates session and displays appropriate response' do
        user_params = {
          "email": 'ben@ben.com',
          "password": "ben123",
          "password_confirmation": "ben123",
          "api_key": "key123"
        }
        User.create(user_params)

        headers = { 'Content-Type' => 'application/json' }
        session_params = {
          "email": 'ben@ben.com',
          "password": "ben123",
        }
        post api_v1_sessions_path, headers: headers, params: session_params.to_json

        expect(response).to be_successful
        expect(response.status).to eq(201)
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response).to have_key(:data)
        expect(parsed_response[:data]).to be_a(Hash)

        expect(parsed_response[:data].keys).to eq(%i[id type attributes])
        expect(parsed_response[:data][:id]).to be_a(String)
        expect(parsed_response[:data][:type]).to eq('users')
        expect(parsed_response[:data][:attributes]).to be_a(Hash)

        expect(parsed_response[:data][:attributes].keys).to eq(%i[email api_key])
        expect(parsed_response[:data][:attributes][:email]).to be_a(String)
        expect(parsed_response[:data][:attributes][:api_key]).to be_a(String)
      end
    end

    describe 'sad path' do

      it 'fails to login without email' do
        headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
        user_params = {
          "email": 'ben@ben.com',
          "password": "ben123",
          "password_confirmation": "ben123",
          "api_key": "key123"
        }
        User.create(user_params)
        headers = { 'Content-Type' => 'application/json' }
        session_params = {
          "password": "ben123",
        }

        post api_v1_sessions_path, headers: headers, params: session_params.to_json

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
      end

      it 'fails to login without password' do
        headers = { 'Content-Type' => 'application/json' }
        user_params = {
          "email": 'ben@ben.com',
          "password": "ben123",
          "password_confirmation": "ben123",
          "api_key": "key123"
        }
        User.create(user_params)
        headers = { 'Content-Type' => 'application/json' }
        session_params = {
          "email": 'ben@ben.com',
        }

        post api_v1_sessions_path, headers: headers, params: session_params.to_json

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
      end
    end
  end
