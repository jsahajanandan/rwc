require 'rails_helper'
require 'spec_helper'

RSpec.describe PlaceholderService, type: :service do
    describe '.fetch' do
        it 'returns an array of posts' do
            stub_request(:get, 'https://jsonplaceholder.typicode.com/posts')
                .to_return(status: 200, body: '[{"title": "Post 1", "body": "Body 1", "userId": 1}]')

            response = PlaceholderService.fetch()
            expect(response).to be_an(Array)
            expect(response.length).to be > 0
            expect(response.first).to have_key('title')
            expect(response.first).to have_key('body')
            expect(response.first).to have_key('userId')
        end
    end

    describe '.fetch2' do
        it 'returns an array of posts' do
            stub_request(:get, 'https://jsonplaceholder.typicode.com/posts')
                .to_return(status: 200, body: '[{"title": "Post 2", "body": "Body 2", "userId": 2}]')

            response = PlaceholderService.fetch2()
            expect(response).to be_an(Array)
            expect(response.length).to be > 0
            expect(response.first).to have_key('title')
            expect(response.first).to have_key('body')
            expect(response.first).to have_key('userId')
        end
    end

    describe '.post' do
        it 'creates a new post' do
            stub_request(:post, 'https://jsonplaceholder.typicode.com/posts')
                .to_return(status: 201, body: '{"id": 1}')

            response = PlaceholderService.post()
            expect(response).to have_key('id')
        end
    end

    describe '.post2' do
        it 'creates a new post' do
            stub_request(:post, 'https://jsonplaceholder.typicode.com/posts')
                .to_return(status: 201, body: '{"id": 2}')

            response = PlaceholderService.post2()
            expect(response).to have_key('id')
        end
    end
end