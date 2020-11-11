# frozen_string_literal: true

class Pet
  attr_accessor :name

  def initialize(name)
    @name = name      # name
    @hunger = 10      # hungry lvl
    @happy = 10       # happy lvl
    @asleep = false   # asleep status
    @cleanliness = 0  # toilet lvl
    @life = 2         # lives
    @water = 10       # water lvl
    @money = 0
    @lvl = 0
    @exp = 0
  end

  def pet_comand
    p '------------------------------------------------------------------------------'
    p '| Виберіть команду :'
    p '| 0 Вийти з гри | 1 майнити | 2 бавитись | 3 їсти | 4 займатись спортом |'
    p '| 5 гуляти | 6 плавати | 7 нічого не робити | 8 сходити в туалет | '
    p '| 9 проспати цілий день | 10 Статус тваринки | 11 Вбивти тваринку |'
    p '| 12 список команд | 13 Гра ⒸⒶⓈⒾⓃⓄ | 14 Попестити | 15 Допомога'
    p '| Введіть номер команди і натисніть Enter (тільки цифру)'
  end

  def help
    p '------------------------------------------------------------------------------'
    p '| Гра Тамагочі from RubyCops'
    p '| Для початку задайте імя вашої тваринки та її вид'
    p '| Далі щоб почати грати напишіть номер команди яку ви хочете виконати'
    p '| Початкові х-ки у вашої тваринки: '
    p '| 10 ситності'
    p '| 10 води'
    p '| 10 щастя'
    p '| 0 туалет'
    p "| #{@life} життя(ів)"
    p '| 0 золота'
    p '| 0 рівень'
    p '| 0 досвіду'
    p '------------------------------------------------------------------------------'
    p '| Команди:'
    p '| 0 Вийти з гри'
    p '| 1 майнити поки хазяїн спить 1..5 золота +10 досвіду'
    p '| 2 бавитись(+2 щастя -2 бажання поїсти -2 води +2 туалет +10 досвіду)'
    p '| 3 їсти (+2 ситності +2 туалет +2 води)'
    p '| 4 займатись різними видами спорту(+2 щастя -2 ситності -2 води +2 туалет +10 досвіду)'
    p '| 5 прогулюватись(+2 щастя -2 ситності -2 води +2 туалет +10 досвіду)'
    p '| 6 плавати(+3 щастя -2 ситності -2 води +2 туалет +10 досвіду)'
    p '| 7 нічого не робити (Поспати годинку -2 щастя -2 ситності -2 води +2 туалет +10 досвіду)'
    p '| 8 сходити в туалет (0 туалет -1 ситності -2 води)'
    p '| 9 проспати цілий день (-4 щастя -4 ситності -4 води +4 туалет)'
    p '| 10 Статус тваринки '
    p '| 11 Вбити тваринку (cheats)'
    p '| 12 Список команд'
    p '| 13 Гра ⒸⒶⓈⒾⓃⓄ'
    p '| 14 Попестити +1 щастя'
    p '| 15 Інформація по грі'
  end

  def status
    p "Статус      : #{@name}"
    p "Рівень      : #{@lvl}"
    p "Досвід      : #{@exp}"
    p "Ситність    : #{@hunger}"
    p "Вода        : #{@water}"
    p "Щастя       : #{@happy}"
    p "Туалет      : #{@cleanliness}"
    p "К-ть життів : #{@life}"
    p "Золота      : #{@money}"
    p 'Введіть команду (загальний список команд 12)'
  end

  def lvlup
    if @exp >= 100
      @lvl += 1
      @exp = 0
      p "**#{@name} досяг ще одного рівня. #{@name} тепер #{@lvl} рівня"
    end
  end

  def mining
    gold = rand(1..5)
    p "#{@name} заробляє #{gold} золота на майнінгу"
    @money += gold
    @exp += 10
    p 'Введіть команду (загальний список команд 12)'
  end

  def say
    "**#{name} привіт як у тебя справи?"
    @happy += 1
  end

  def casino
    p ' - ⒸⒶⓈⒾⓃⓄ - '
    p "У вас на рахунку : #{@money}"
    bet = rand(-10..10)
    if !@money.zero? && !@money.negative?
      p "Ставка : #{bet}"
      if bet.positive?
        p " - ⓌⒾⓃ - Ви вийграли #{bet} золота"
        @money += bet
        p "У вас на рахунку: #{@money}"
        p 'Щоб продовжити грати напишіть 13, загальний список команд 12'
      else
        p " - ⓁⓄⓈⒺ - Ви програли #{bet} золота"
        @money -= bet.abs
        p "У вас на рахунку: #{@money}" if @money.positive?
        p "Ви взяли в кредит: #{@money}" if @money.negative?
        p 'Щоб продовжити грати напишіть 13, загальний список команд 12'
      end
    else
      p "У вас #{@name} немає золота щоб робити ставку"
    end
  end

  def lose_life
    @life -= 1
    p "** #{@name} втратив одне життя" if @life != 1
    p "** #{@name} треба нагально покормити, бо помре" if @life == 1
    p "** #{@name} втратив останнє життя" if @life.zero?
  end

  def time_pass
    if @hunger >= 0
      @hunger -= 2
      @happy -= 2
      @water -= 2
      @cleanliness += 2
    else
      asleep_f if @asleep
      lose_life
    end
    if @cleanliness >= 10
      @cleanliness = 0
      p "** #{@name} раптово сходив в туалет на любиму ковдру, треба частіше вигулювати"
    end
    if hungry?
      asleep_f
      rnd = rand(3)
      case rnd
      when 0
        p "** #{@name} я хочу їсти" if @life != 0
      when 1
        p "** #{@name} пюрешечки да с котлеткой би ...." if @life != 0
      when 2
        p "** #{@name} накорми мене ..." if @life != 0
      else
        p ' - я скоро захочу їсти!'
      end
    end
    inform
    die
    angry
    lvlup
    love
    toilet if @cleanliness >= 8
  end

  def feed
    @hunger += 2
    @water += 2
    @cleanliness += 2
    p "** #{@name} поїв, ммм, дуже смачно"
    toilet if @cleanliness >= 8
    inform
  end

  def asleep_f
    @asleep = false
    rnd = rand(3)
    case rnd
    when 0
      p "** #{@name} невпинно дивиться на вас" if @life != 0
    when 1
      p "** #{@name} підійшов по ближче і дивиться вам в очі" if @life != 0
    when 2
      p "** #{@name} сидить сумує ... " if @life != 0
    else nil
    end
  end

  def timetosleep
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
    @water -= 4
    @happy -= 4
    @hunger -= 4
    @cleanliness -= 4
    inform
  end

  def love
    rnd = rand(5)
    case rnd
    when 0
      p "** #{@name} дуже щасливий і обнімає вас" if @happy > 8
    when 1
      p "** #{@name} дуже щасливий і любить вас " if @happy > 9
    when 2
      p "** #{@name} душі в вас нечаїть" if @happy > 10
    else
      @asleep = false
    end
  end

  def angry
    rnd = rand(6)
    case rnd
    when 0
      p "** #{@name} розізлився на вас" if @happy < 5
    when 1
      p "** #{@name} вкусив вас " if @happy < 3
    when 2
      p "** #{@name} спробував на вас напасти" if @happy < 2
    else
      @asleep = false
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
        p ' - Я трохи хочу відпочити!'
      end
      time_pass
      @exp += 10
    else
      p "** #{@name} ще не має бажання гратись"
    end
  end

  def poop?
    @cleanliness >= 6
  end

  def toilet
    if poop?
      p "** #{@name} упс, сходив в куточку в туалет"
      @cleanliness = 0
      @hunger -= 1
      @water -= 1
    else
      p "** #{@name} скоро захоче в туалет ..."
    end
    inform
  end

  def die
    if @life.zero?
      p "『RɨP』〘#{@name}♔〙"
      p "✝✝✝ #{@name} помер, його смерть на вашій совісті ✝✝✝"
      exit
    end
  end

  def kill
    @life = 0
    die
  end

  def inform
    p 'Введіть команду (загальний список команд 12)'
  end

  def sport
    p "**#{@name} займається спортом"
    @happy += 4
    @exp += 10
    time_pass
  end

  def swim
    p "**#{@name} плаває в басейні"
    @happy += 5
    @exp += 10
    time_pass
  end

  def walk
    @exp += 10
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
      p ' - щось не хочеться!'
    end
    time_pass
  end

  private :time_pass
end
