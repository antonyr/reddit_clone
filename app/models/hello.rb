class Hello
  def self.hello(*args)
    args.each do |arg|
      define_method(arg) do
        puts "hello #{arg}"
      end
    end
  end
  hello :kumar

  def self.jello(*args)
    args.each do |arg|
    instance_eval(%Q(
      def #{arg}
        puts "jello #{arg}"
      end
    ));
    end
  end

  jello :kumar
end
h = Hello.new.kumar
Hello.kumar
class Array
  def first
    puts 'hello'
  end
end
[1, 2].first
puts [1, 2].last

