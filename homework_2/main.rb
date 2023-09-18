class Raspberry
  attr_reader :state

  STATES = [:цветение, :зеленая, :спелая]

  def initialize(index)
    @index = index
    @state = STATES.first
  end

  def grow!
    current_index = STATES.index(@state)
    @state = STATES[current_index + 1] if current_index < STATES.length - 1
  end

  def ripe?
    @state == STATES.last
  end
end

class RaspberryBush
  def initialize(num_raspberries)
    @raspberries = []
    num_raspberries.times { |i| @raspberries << Raspberry.new(i) }
  end

  def grow_all!
    @raspberries.each(&:grow!)
  end

  def ripe_all?
    @raspberries.all?(&:ripe?)
  end

  def give_away_all!
    @raspberries.clear
  end
end

class Human
  attr_reader :name

  def initialize(name, raspberry_bush)
    @name = name
    @raspberry_bush = raspberry_bush
  end

  def work!
    @raspberry_bush.grow_all!
  end

  def harvest
    if @raspberry_bush.ripe_all?
      puts "#{@name} собрал урожай!"
      @raspberry_bush.give_away_all!
    else
      puts "#{@name}, ещё рано собирать урожай."
    end
  end

  def self.knowledge_base
    puts "Садоводство - это искусство выращивания растений."
    puts "Чтобы вырастить хороший урожай, нужно следить за состоянием растений и своевременно ухаживать за ними."
  end
end

if __FILE__ == $PROGRAM_NAME
  Human.knowledge_base

  raspberry_bush = RaspberryBush.new(5)
  gardener = Human.new("Aleksandr", raspberry_bush)

  5.times do
    gardener.work!
    gardener.harvest
  end
end
