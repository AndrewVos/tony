require 'ostruct'
require 'fileutils'

module Tony
  class Generator
    attr_reader :name, :description, :files
    def initialize(&block)
      options = OpenStruct.new
      yield options
      @name = options.name
      @description = options.description
      @files = options.files
    end

    def generate
      files.each do |path, contents|
        FileUtils.mkdir_p(File.dirname(path))
        puts "create #{path}" unless File.exist?(path)
        puts "append #{path}" if File.exist?(path)
        File.open(path, 'a') do |file|
          file.puts(contents)
        end
      end
    end
  end
end
