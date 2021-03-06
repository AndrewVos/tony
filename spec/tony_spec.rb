require_relative 'helper'

describe Tony do
  def mock_generator(name, combination = nil)
    mock_generator = mock
    mock_generator.stub!(:name).and_return(name)
    mock_generator.stub!(:combination).and_return(combination)
    mock_generator
  end

  def setup_arguments(arguments)
    ARGV.clear
    arguments.each do |argument|
      ARGV.push(argument)
    end
  end

  it "stores a list of used generators" do
    setup_arguments(['generator'])
    generator = mock_generator('generator')
    Tony.stub!(:generators).and_return([generator])
    Tony.used_generators.should == [generator]
  end

  it "stores a list of combination generators if all combinations are used" do
    setup_arguments(['generator1', 'generator2'])
    generator1 = mock_generator('generator1')
    generator2 = mock_generator('generator2')
    combination_generator = mock_generator('combination_generator', ['generator1', 'generator2'])
    Tony.stub!(:generators).and_return([generator1, generator2, combination_generator])
    Tony.used_generators.should == [generator1, generator2, combination_generator]
  end

  it "sends generate to all generators" do
    generator = mock_generator('test_generator')
    Tony.stub(:used_generators).and_return([generator])
    generator.should_receive(:generate).once
    Tony.generate
  end

  it "outputs a list of generators" do
    setup_arguments([])
    generator = mock_generator('generator')
    combination_generator = mock_generator('combination generator', ['generator'])
    Tony.stub!(:generators).and_return([generator, combination_generator])
    Tony.should_receive(:puts).with('Supported Generators').ordered
    Tony.should_receive(:puts).with('generator').ordered
    Tony.should_receive(:puts).ordered
    Tony.should_receive(:puts).with('Combination Generators').ordered
    Tony.should_receive(:puts).with('combination generator').ordered
    Tony.generate
  end
end
