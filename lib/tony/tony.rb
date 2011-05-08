module Tony
  def self.generate
    generators = [
      RSpecGenerator
    ]
    ARGV.each do |argument|
      generator = generators.find { |g| g.title == argument }
      generator.generate
    end
  end
end
