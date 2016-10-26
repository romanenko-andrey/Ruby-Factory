class Factory
  def self.new(*attr_name, &block)
    Class.new do
      attr_accessor(*attr_name)
      define_method :initialize do |*attr_values|
        @attr_values = attr_values
        attr_name.zip(attr_values).each {|name, value|  send("#{name}=", value)}
        def [](param)
          (param.is_a?Numeric) ? @attr_values[param] : send(param)
        end

        instance_eval(&block) if block_given?
      end
    end
  end
end


#TEST

Customer = Factory.new(:first_name, :address, :zip) do
  def greeting
    "Hello #{first_name}!"
  end
end

joe = Customer.new('Andrey', 'Dnepr-city', 49000)

puts '!=>' + joe.first_name.to_s    # => "Andrey"
puts '!!=>' + joe['first_name'].to_s # => "Andrey"
puts '!!!=>' + joe[:first_name] .to_s # => "Andrey"
puts '!!!!=>' + joe[0].to_s          # => "Andrey"
puts joe.greeting # => "Hello Andrey!"

puts Customer.new('Bob', 'Dnepr-city', 49000).greeting # => "Hello Bob!"
