require 'fileutils'

module Tony
  class Generator
    attr_accessor :name, :description, :files, :gems, :combination

    def initialize(&block)
      yield self
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
