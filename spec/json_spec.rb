require 'spec_helper'

describe App::Base do
  it 'should response with root' do
    get '/with-root/'
    match_response_schema(:test_with_root)
  end

  it 'should response without root' do
    get '/without-root/'
    match_response_schema(:test_without_root)
  end

  it 'should response with specific serializer' do
    get '/with-specific-serializer/'
    match_response_schema(:test_with_specific_serializer)
  end
end