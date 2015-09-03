class Closure
  def self.play_block(num)
    get_fibonacci_hacked(num) do |fibonacci_hacked|
      puts "playing with blocks: #{fibonacci_hacked}"
    end
  end

  def self.play_lambda(num)
    # lamb = lambda do |fibonacci_hacked|
    lamb = ->(fibonacci_hacked) do
      puts "playing with lambda: #{fibonacci_hacked}"
    end
    get_fibonacci_hacked(num, &lamb)
  end

  def self.play_proc(num)
    proc = Proc.new do |fibonacci_hacked|
      puts "playing with proc: #{fibonacci_hacked}"
    end
    get_fibonacci_hacked(num, &proc)
  end

  private

  def self.get_fibonacci_hacked(seed, &block)
    [1, 2, 3, 5].inject(0) do |sum, num|
      hacked_num = num * seed
      block.call hacked_num
      sum += hacked_num
    end
  end
end