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

  it "has a name" do
    Tony::RSpecGenerator.new.name.should == "rspec"
  end

  it "has a description" do
    Tony::RSpecGenerator.new.description.should == "Generates rspec rake tasks, spec directories and a spec_helper"
  end

  it "creates a rake file" do
    generator = Tony::RSpecGenerator.new
    generator.generate
    File.exist?(File.join(@test_directory, 'Rakefile')).should == true
  end

  it "generates a rake task" do
    generator = Tony::RSpecGenerator.new
    generator.generate
    expected_rake_task = File.read(File.join(File.dirname(__FILE__), '../../lib/tony/generators/rspec-rake-task.rb'))
    File.read(File.join(@test_directory, 'Rakefile')).should include expected_rake_task
  end
end
