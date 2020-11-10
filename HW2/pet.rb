
class Pet
  def initialize(name, type, owner)
    @name = name      # ім'я
    @type = type      # клас тваринки
    @owner = owner    # власник тваринки
    @hunger = 10      # рівень голоду
    @happy = 10       # рівень щастя
    @asleep = false   # стан тваринки спить, не спить
    @cleanliness = 10 # рівень бажання сходити до туалету
    @live = true
    help
    comands
    start
  end

  def status
    p "Статус #{@type} : #{@name}"
    p "Ситність : #{@hunger}"
    p "Щастя    : #{@happy}"
    p "Туалет   : #{@cleanliness}"
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
    @hunger += 2
    @cleanliness += 2
    p "** #{@name} ммм, дуже смачно"
  end
  def asleep_f
    @asleep = false
    p "** #{@name} невпинно дивиться на вас "
  end
  def time_pass
    if @hunger >= 0
    @hunger -= 1
    @happy -= 1
    @cleanliness +=1
    else
      asleep_f if @asleep
      p "** #{@name} почав їсти ваші шнурки на взутті, треба нагально покормити"
      exit
    end
    if @cleanliness >= 10
      @cleanliness = 0
      p "** #{@name} раптово сходив в туалет на любиму ковдру, треба частіше вигулювати"
    end
    asleep_f if hungry?
    p "** #{@name} я хочу їсти!!!"
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

  def hungry?
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
      @happy += 2
      @hunger -= 2
    else
      p "** #{@name} я не хочу гратися"
    end
  end

  def poop?
    @cleanliness >= 7
  end

  def toilet
    if poop?
      p "** #{@name} сходив в туалет"
      @cleanliness = 0
      @hunger -= 2
    else
      p "** #{@name} я не хочу в туалет"
    end
  end
  def sport
    @happy += 2
    @hunger -= 2
  end
  def swim
    @happy += 3
    @hunger -= 2
  end
  def comands
    p '-----------------------------------------------'
    p 'Комманды:'
    p '0 Вийти з гри'
    p '1 Привітатись'
    p '2 бавитись(+2 щастя -2 бажання поїсти)'
    p '3 їсти (+2 ситності +2 туалет)'
    p '4 займатись різними видами спорту(+2 щастя -2 ситності)'
    p '5 прогулюватись(+2 щастя -2 ситності)'
    p '6 плавати(+3 щастя -2 ситності)'
    p '7 нічого не робити (Проспати цілий день-3 щастя -3 ситності)'
    p '8 вивести в туалет (0 туалет -2 ситності)'
    p '9 поспати '
    p '10 Стан тваринки '
    p '11 Вбити тваринку'
    p '12 Список команд'
    p 'Введіть номер команди (тільки цифру)'
  end
  def help
    p '-----------------------------------------------'
    p 'Щоб почати грати напишіть start'
    p 'Спочатку у вашої тваринки: '
    p '10 ситності'
    p '10 щастя'

  end

  def new_pet
    p " - Вітаю мій господарю, мене звати #{@name}, хочу нагадати що я видатна тваринка із сімейства #{@type}"
  end

  def start

    while true
      if @hunger <= 0
        die
        @live = false
        break
      end

      command = gets.chomp.downcase
      case command
      when '1'
        new_pet
      when '2'
        play
      when '3'
        feed
      when '4'
        sport
      when '5'
        walk
      when '6'
        swim
      when '7'
        time_pass
      when '8'
        toilet
      when '9'
        timeToSleep
      when '10'
        status
      when '11'
        kill
      when '12'
        comands
      when '0'
        break
      else
        p "sorry, i don't know this command: #{command}"
      end
    end
  end

  def die
    p "✝✝✝ #{@name} помер, його смерть на вашій совісті ✝✝✝"
  end

  def kill
    die
    @live = false
  end
  private :die, :walk, :kill, :happy?, :poop?, :toilet, :status, :hungry?, :poop?, :status, :timeToSleep, :time_pass, :feed, :play
end


dragon = Pet.new('Nickson', 'Dog', 'Oleksii')
dragon.start
