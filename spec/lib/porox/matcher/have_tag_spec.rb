require 'spec_helper'
require 'porox/matcher/have_tag'

describe "Porox::Matcher::HaveTag" do
  before(:each) do
    @matcher = Porox::Matcher::HaveTag.new("/foo/bar")
  end

  it "should match a single tag" do
    @matcher.matches?("<foo><bar /></foo>").should be(true)
  end

  it "should match several tags" do
    @matcher.matches?("<foo><bar /><bar /></foo>").should be(true)
  end

  it "should fail if it matches no tags" do
    @matcher.matches?("<foo><baz /><quux /></foo>").should be(false)
  end
end
