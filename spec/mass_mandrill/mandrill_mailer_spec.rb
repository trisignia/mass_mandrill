require 'spec_helper'

describe MassMandrill::MandrillMailer do
  class DummyMailer < MassMandrill::MandrillMailer
    def dummy_notification
      mail(:from => "Example Company <example.company@example.com>",
          :global_merge_vars => { :name => 'var1', :content => 'var1_value' })
    end
  end

  before do
    ::Mandrill::API.stub(:new)
    @mailer = DummyMailer.dummy_notification
  end

  describe "message" do
    before do
      @message = @mailer.message
    end

    specify { @message[:from_email].should ==  "example.company@example.com" }
    specify { @message[:from_name].should == "Example Company" }
    specify { @message[:global_merge_vars].should == { :name => 'var1', :content => 'var1_value' } }
  end
end
