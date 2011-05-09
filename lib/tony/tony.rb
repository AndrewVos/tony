module Tony
  def self.generators
    @@generators = [] unless defined? @@generators
    @@generators
  end
  
  def self.used_generators
    generators.select { |g| ARGV.include?(g.name) }
  end

  def self.generate
    used_generators.each do |used_generator|
      used_generator.generate
    end
  end
end
