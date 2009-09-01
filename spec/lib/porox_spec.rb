require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Porox" do
  it "should be versioned" do
    lambda {
      Porox.const_get(:VERSION)
    }.should_not raise_error
  end

  it "should be version 0.0.1" do
    Porox::VERSION.should eql("0.0.1")
  end

  it "should know where the lib dir lives" do
    lib_dir = File.dirname(__FILE__) + '/../../lib'
    File.expand_path(lib_dir).should eql(Porox.lib_dir)
  end

  describe "adding itself to the load path" do
    before(:each) do
      $:.delete(Porox.lib_dir)
    end

    it "should add itself to the start of the load path" do
      Porox.add_to_load_path
      $:[0].should == Porox.lib_dir
    end

    it "should not change the load path if it is already present" do
      Porox.add_to_load_path
      load_path = $:
      Porox.add_to_load_path
      $:.should eql($:)
    end
  end
end
