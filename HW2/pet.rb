
class Pet
  def initialize(name, type, owner)
    @name = name      # ім'я
    @type = type      # клас тваринки
    @owner = owner    # власник тваринки
    @hunger = 10      # рівень голоду
    @happy = 10       # рівень щастя
    @asleep = false   # стан тваринки спить, не спить
    @cleanliness = 10 # рівень бажання сходити до туалету
    p " - Вітаю мій господарю, мене звати #{@name}, хочу нагадати що я видатна тваринка із сімейства #{@type}"
  end

  def status
    p "Статус #{@type} : #{@name}"
    p "Голод : #{@hunger}"
    p "Щастя : #{@happy}"
  end

  def walk
    time_pass
    rnd = rand(3)
    p "** #{@name} пішов гуляти на вулицю ..."
    case rnd
    when 0
      p ' - З тобою гуляти саме заловолення!'
    when 1
      p ' - Як сьогодні гарно на вулиці :)'
    when 2
      p ' - А вчора ми гуляли довше!'
    else
      p ' - Я не буду з тобою більше гуляти!'
    end
  end

  def feed
    @hunger += 1
    toilet if feed && @hunger >= 7
  end

  def time_pass
    if @hunger >= 0

    @hunger -= 1
    @happy -= 1
    @cleanliness +=1
    else
      if @asleep
        @asleep = false
        p "** #{@name} прокидаеться "
      end
      p "** #{@name} почав їсти ваші шнурки на взутті, треба нагально покормити"
    end
    die
  end

  def timeToSleep
    p "** #{@name} солодко засипа у вас на руках ..."
    @asleep = true
    2.times do
      time_pass if @asleep
      p "#{@name} - солоденько спить .... хррр хррр... хрр.... ." if @asleep
      p "#{@name} - ... хррр хррр... хрр....хфьююю ." if @asleep
      p "#{@name} - зіває і далі спить ... хррр хррр... хрр....хфьююю ." if @asleep
    end
    if @asleep
      @asleep = false
      p "** #{@name} повільно відкрива оч відкрива очі ."
    end
  end

  def hunger?
    @hunger < 5 ? true : false
  end

  def happy?
    @happy < 5 ? true : false
  end

  def play
    if happy?
      rnd = rand(3)
      case rnd
      when 0
        p "** #{@name} грається з м'ячиком"
      when 1
        p "** #{@name} став пілотом справжнього літака"
      when 2
        p "** #{@name} покоряє вершину гори на подвір'ї"
      else
        p ' - Я не буду з тобою більше гуляти!'
      end
      @happy +=2
    else
      p "** #{@name} я не хочу гратися"
    end
  end

  def poop?
    @hunger <= 7
  end

  def toilet
    if poop?
      p "** #{@name} сходив в туалет"
      @cleanliness -= 1
    else
      p "** #{@name} я не хочу в туалет"
    end
  end
  def sport
    @happy += 2
    @hunger -= 2
  end
  def swim
    @happy +=2
    @hunger
  end
  def comands
    puts 'Комманды:'
    puts 'play(+2 щастя -2 бажання поїсти)'
    puts 'eat(+2 ситності)'
    puts 'sport(+2 щастя -2 ситності)'
    puts 'walk(+2 щастя -1 ситності)'
    puts 'swim(+5 щастя -2 ситності)'
    puts 'watch(Проспати цілий день)'
    print 'Один день (-3 щастя -3 ситності '
  end

  def help
    puts 'Щоб почати грати напишіть start'
    puts 'Спочатку у вашої тваринки: '
    puts '10 ситності'
    puts '10 щастя'
    comands
  end
  def start()
    command = ''
    until command == exit
      command = gets.chomp
      case command
      when 1
        p 'start'
      when 2
      p 'start'

      end
    end
    end


  def die
    p "✝✝✝ #{@name} помер, його смерть на вашій совісті ✝✝✝" if @hunger <= 0
  end


  def kill
    @hunger = 0
    die
  end

  private :die, :walk, :kill, :happy?, :poop?, :toilet, :status, :hunger?, :poop?, :status, :timeToSleep, :time_pass, :feed, :play
end


dragon = Pet.new('Nickson', 'Dog', 'Oleksii')
dragon.start
