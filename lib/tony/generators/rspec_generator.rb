module Tony
  class RSpecGenerator
    attr_reader :name
    attr_reader :description

    def initialize
      @name = "rspec"
      @description = "Generates rspec rake tasks, spec directories and a spec_helper"
    end

    def generate
      Generator.new('Rakefile') do
        File.read(File.join(File.dirname(__FILE__), 'rspec-rake-task.rb'))
      end.write
    end
  end
end
