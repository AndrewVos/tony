require_relative 'helper'

describe Tony::Generator do
  before :each do
    @test_directory = File.join(File.dirname(__FILE__), 'test')
    Dir.mkdir(@test_directory)
  end

  after :each do
    FileUtils.rm_rf(@test_directory)
  end

  it "takes a name" do
    generator = Tony::Generator.new do |options|
      options.name = "name"
    end
    generator.name.should == "name"
  end

  it "takes a combination" do
    generator = Tony::Generator.new do |options|
      options.combination = ['generator1', 'generator2']
    end
    generator.combination.should == ['generator1', 'generator2']
  end

  it "stores gems" do
    generator = Tony::Generator.new do |options|
      options.gems = ["rspec", "sinatra"]
    end
    generator.gems.should == ["rspec", "sinatra"]
  end

  it "takes a description" do
    generator = Tony::Generator.new do |options|
      options.description = "description"
    end
    generator.description.should == "description"
  end

  it "takes files" do
    expected_file_contents = {'file1' => 'file1 contents'}
    generator = Tony::Generator.new do |options|
      options.files = expected_file_contents
    end
    generator.files.should == expected_file_contents
  end

  describe ".generate" do
    it "creates files if they don't exist" do
      test_file = File.join(@test_directory, 'test.file')
      generator = Tony::Generator.new { |options|
        options.files = {
          test_file => ''
        }
      }.generate
      File.exist?(test_file).should == true
    end

    it "creates all directories below the file if they don't exist" do
      non_existent_directory = File.join(@test_directory, 'non_existent_directory')
      test_file = File.join(non_existent_directory, 'test.file')
      generator = Tony::Generator.new { |options|
        options.files = {
          test_file => ''
        }
      }.generate
      File.directory?(non_existent_directory).should == true
      File.exist?(test_file).should == true
    end

    it "writes the specified text to the file" do
      test_file = File.join(@test_directory, 'test.file')
      file_contents = "this is some text"
      generator = Tony::Generator.new { |options|
        options.files = {
          test_file => file_contents
        }
      }.generate
      File.read(test_file).should == file_contents + "\n"
    end

    it "appends the specified text to the file if it exists" do
      test_file = File.join(@test_directory, 'test.file')
      generator = Tony::Generator.new { |options|
        options.files = {
          test_file => "hello"
        }
      }
      generator.generate
      generator.generate
      File.read(test_file).should == "hello\nhello\n"
    end

    it "outputs information about whether the file was created or appended" do
      test_file = File.join(@test_directory, 'test.file')
      generator = Tony::Generator.new { |options|
        options.files = {
          test_file => ''
        }
      }
      generator.should_receive(:puts).with("create #{test_file}")
      generator.generate
      generator.should_receive(:puts).with("append #{test_file}")
      generator.generate
    end
  end
end
