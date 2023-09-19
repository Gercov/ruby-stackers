class TextAdventureGame
  def initialize
    @player_code = ""
    @game_over = false
  end

  def start
    puts "Добро пожаловать в игру!"
    puts "Вы - молодой программист, и вам нужно написать базовый код"
    puts "Введите команду 'exit' для выхода из игры"

    until @game_over
      puts "\nЧто вы хотите сделать?"
      puts "1. Написать код"
      puts "2. Проверить код"
      puts "3. Выйти из игры"
      print "> "

      choice = gets.chomp.downcase

      case choice
      when "1"
        write_code
      when "2"
        check_code
      when "3", "exit"
        exit_game
      else
        puts "Неверная команда, повторите ввод"
      end
    end
  end

  def write_code
    puts "Введите код:"

    code = gets.chomp
    @player_code += code

    puts "Ваш код: #{@player_code}"
  end

  def check_code
    if @player_code.empty?
      puts "Вы ничего не написали, попробуйте еще раз"
    else
      puts "Код проверен!"
      @game_over = true
    end
  end

  def exit_game
    puts "Вы вышли из игры"
    @game_over = true
  end
end

game = TextAdventureGame.new
game.start
