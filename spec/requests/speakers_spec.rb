# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Speakers endpoint', type: :request do
  let(:user) { create(:user) }
  let!(:speakers) { create_list(:speaker, 10, :with_avatar) }
  let(:headers) { valid_headers }

  describe 'GET /speakers' do
    # make HTTP get request before each example
    before { get '/speakers' }

    it 'returns 10 speakers' do
      expect(json).not_to be_empty
      expect(json['speakers'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /speakers' do
    # valid payload
    let(:valid_attributes) do
      { name: 'Rafael Almeida',
        email: 'rafael.almeida@xing.com',
        company: 'XING',
        avatar: fixture_file_upload(
          Rails.root.join('spec', 'support', 'assets', 'test-avatar.png'), 'image/png'
        ) }
    end

    # invalid payload
    let(:invalid_attributes) do
      { name: 'Foobar' }.to_json
    end

    context 'when the request is valid' do
      before { post '/speakers', params: valid_attributes, headers: headers }

      it 'creates a speaker' do
        expect(json['speaker']['name']).to eq('Rafael Almeida')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/speakers', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Email can't be blank, Company can't be blank/)
      end
    end
  end
end
