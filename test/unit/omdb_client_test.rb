require 'minitest/autorun'
require 'vcr'

require_relative '../../app/services/omdb/client'

module Omdb
  VCR.configure do |c|  
    c.cassette_library_dir = 'test/assets/vcr_cassettes'
    c.hook_into :webmock
  end

  class ClientTest < MiniTest::Spec
    describe '#search_by_imdb_id' do
      describe 'with invalid id' do
        it 'returns a MovieNotFoundClass' do
          VCR.use_cassette('invalid_id') do
            response = Client.search_by_imdb_id 'invalid_id'
            response.class.must_equal Omdb::MovieNotFound
          end
        end
      end

      describe 'with valid id' do
        it 'returns the correct data' do
          VCR.use_cassette('valid_id') do
            response = Client.search_by_imdb_id 'tt1139328'
            response.class.must_equal Hash
            response['Title'].must_equal 'The Ghost Writer'
            response['Director'].must_equal 'Roman Polanski'
          end
        end
      end
    end
  end
end
