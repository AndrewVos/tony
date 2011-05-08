module Tony
  class Generator
    def initialize(path, &block)
      @file_paths = {} unless defined? @file_paths
      @file_paths[path] = block
    end
    def write
      @file_paths.each do |path, block|
        FileUtils.mkdir_p(File.dirname(path))
        File.open(path, 'w') do |file|
          if block != nil
            file.puts block.call
          end
        end
      end
    end
  end
end
