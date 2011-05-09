require_relative 'helper'

describe Tony do
  before :each do
    @test_generator = mock
    @test_generator.stub!(:generate)
    Tony.stub!(:generators).and_return([@test_generator])
  end

  it "stores a list of used generators" do
    ARGV = ['test_generator']
    @test_generator.stub!(:name).and_return('test_generator')
    Tony.used_generators.should == [@test_generator]
  end

  it "sends generate to all generators" do
    Tony.stub(:used_generators).and_return([@test_generator])
    @test_generator.should_receive(:generate).once
    Tony.generate
  end
end
