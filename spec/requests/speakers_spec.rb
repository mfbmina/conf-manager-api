# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Speakers endpoint', type: :request do
  let!(:speakers) { create_list(:speaker, 10, :with_avatar) }

  describe 'GET /speakers' do
    # make HTTP get request before each example
    before { get '/speakers' }

    it 'returns speakers' do
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

    context 'when the request is valid' do
      before { post '/speakers', params: valid_attributes }

      it 'creates a speaker' do
        expect(json['speaker']['name']).to eq('Rafael Almeida')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/speakers', params: { name: 'Foobar' } }

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
