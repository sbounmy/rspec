require File.dirname(__FILE__) + '/../../spec_helper.rb'

module Spec
  module DSL
    describe Configuration do
      setup do
        @config = Configuration.new
        @behaviour = mock("behaviour")
      end

      it "should default mock framework to rspec" do
        @behaviour.should_receive(:mock_with).with(:rspec)
        @config.configure(@behaviour)
      end

      it "should let you set the mock framework" do
        @config.mock_with(:other_framework)
        @behaviour.should_receive(:mock_with).with(:other_framework)
        @config.configure(@behaviour)
      end
    end
  end
end