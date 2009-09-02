require 'spec_helper'
require 'porox/mapper'

describe "Porox::Mapper" do
  class NamedObject; attr_accessor :name; end

  before(:each) do
    @mapper = Porox::Mapper.new
  end

  it "should allow mappings for plain data containers to be registered" do
    @mapper.should respond_to(:register)
  end

  describe "for a simple mapping" do
    describe "going from XML to a Ruby object" do
      before(:each) do
        @xml = %Q(<named-object name="Charles" />)
      end

      it "should provide the expected class of object" do
       result = @mapper.to_ruby(@xml)
       result.should be_kind_of(NamedObject)
      end

      it "should set the attributes correctly" do
       result = @mapper.to_ruby(@xml)
       result.name.should eql("Charles")
      end
    end

    describe "going from a Ruby object to XML" do
      before(:each) do
        @object = NamedObject.new
        @object.name = "Brian"
      end

      it "should return an XML representation of the object" do
       result = @mapper.to_xml(@object)
       result.should have_tag("/named-object[@name=Brian]")
      end
    end
  end
end
