
class Pet
  def initialize(name, type, owner)
    @name = name      # ім'я
    @type = type      # клас тваринки
    @owner = owner    # власник тваринки
    @hunger = 10      # рівень голоду
    @happy = 10       # рівень щастя
    @asleep = false   # стан тваринки спить, не спить
    @cleanliness = 10 # рівень чистоти
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
    @hunger -= 1
    @happy -= 1
  end
  private :time_pass

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




  def start(choise)
    case choise
    when 'start'
      p 'start'
    end
  end

end


dragon = Pet.new('Richard', 'Dog', 'Oleksii')
dragon.walk
dragon.timeToSleep
dragon.walk
dragon.status
dragon.walk
dragon.walk
dragon.status
dragon.play




