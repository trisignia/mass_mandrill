require "spec_helper"

describe "MassMandrill configuration" do
  before do
    MassMandrill.config do |config|
      config.api_key = 'key-123'
    end
  end

  specify { MassMandrill.config.api_key.should == 'key-123' }
end
