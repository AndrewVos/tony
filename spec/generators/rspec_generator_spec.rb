require 'rspec'
require 'fileutils'

describe Tony::RSpecGenerator do
  before :each do
    @test_directory = File.join(File.dirname(__FILE__), 'test')
    Dir.mkdir(@test_directory)
    @old_working_directory = Dir.getwd
    Dir.chdir @test_directory
  end

  after :each do
    FileUtils.rm_rf(@test_directory)
    Dir.chdir @old_working_directory
  end

  it "can be executed from the command line" do
    ARGV = ['rspec']
    Tony::RSpecGenerator.should_receive(:generate)
    Tony::generate
  end

  it "has a title" do
    Tony::RSpecGenerator.title.should == "rspec"
  end

  it "has a description" do
    Tony::RSpecGenerator.description.should == "Generates rspec rake tasks, spec directories and a spec_helper"
  end

  it "creates a rake file" do
    Tony::RSpecGenerator.generate
    File.exist?(File.join(@test_directory, 'Rakefile')).should == true
  end

  it "generates a rake task" do
    Tony::RSpecGenerator.generate
    expected_rake_task = File.read(File.join(File.dirname(__FILE__), '../../lib/tony/generators/rspec-rake-task.rb'))
    File.read(File.join(@test_directory, 'Rakefile')).should include expected_rake_task
  end
end
