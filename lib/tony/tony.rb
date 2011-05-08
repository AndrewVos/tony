module Tony
  def self.generators
    @@generators = [] unless defined? @@generators
    @@generators
  end
  def self.generate
    ARGV.each do |argument|
      generator = generators.find { |g| g.name == argument }
      generator.generate
    end
  end
end
