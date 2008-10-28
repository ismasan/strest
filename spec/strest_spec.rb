require File.dirname(__FILE__) + '/spec_helper.rb'

class SomeObject
  include Strest::Client
end

class SomeObjectMapper;end

describe Strest::Client do
  
  before(:all) do
    SomeObject.site = 'http://api.some.com'
  end
  
  it "should have a default mapper class" do
    SomeObject.default_mapper.should == Strest::ResponseMapper
  end
  
  it "should have a connection object" do
    SomeObject.connection.class.should == Strest::Connection
    SomeObject.new.connection.class.should == Strest::Connection
  end
  
  describe "custom class-level mapper class" do
    before(:all) do
      SomeObject.map_with SomeObjectMapper
    end
    
    it "should be possible to set custom response mapper class" do
      SomeObject.default_mapper.should == SomeObjectMapper
    end
  end
  
  describe "with site parameter" do
    
    it "should have site parameter at class level" do
      SomeObject.site.should == URI.parse('http://api.some.com')
    end
  end
  
  describe "defining get method macros" do
    before(:all) do
      SomeObject.get :all, '/some/method'
      SomeObject.get :find, '/objects/all'
    end
    
    it "should create class methods" do
      SomeObject.respond_to?(:all).should be_true
      SomeObject.respond_to?(:find).should be_true
    end
    
    it "should send request through connection" do
      SomeObject.connection.stub!(:get)
      SomeObject.connection.should_receive(:get).with('/some/method')
      SomeObject.all
    end
    
    it "should store path for each method"
  end
  
end
