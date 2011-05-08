module Tony
  class RSpecGenerator
    def self.title
      "rspec"
    end
    
    def self.description
      "Generates rspec rake tasks, spec directories and a spec_helper"
    end

    def self.generate
      Generator.new('Rakefile') do
        File.read(File.join(File.dirname(__FILE__), 'rspec-rake-task.rb'))
      end.write
    end
  end
end
