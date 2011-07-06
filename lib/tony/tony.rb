module Tony
  def self.generators
    @@generators = [] unless defined? @@generators
    @@generators
  end

  def self.used_generators
    used_generators = []
    generators.each do |generator|
      used_generators << generator if ARGV.include?(generator.name)
      if generator.combination
        used_generators << generator if (ARGV - generator.combination).size == (ARGV.size - generator.combination.size)
      end
    end
    used_generators
  end

  def self.generate
    if ARGV.size == 0
      puts 'Supported Generators'
      generators.each do |generator|
        puts generator.name unless generator.combination
      end
      puts
      puts 'Combination Generators'
      generators.each do |generator|
        puts generator.name if generator.combination
      end
    end
    used_generators.each do |used_generator|
      used_generator.generate
    end
  end
end
