require 'spec_helper'
require 'porox'

describe "Porox" do
  it "should be versioned" do
    lambda {
      Porox.const_get(:VERSION)
    }.should_not raise_error
  end

  it "should be version 0.0.1" do
    Porox::VERSION.should eql("0.0.1")
  end
end
