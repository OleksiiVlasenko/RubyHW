# frozen_string_literal: true
require "erb"


class Pet
  attr_accessor :name

  def initialize(name)
    @name = name      # name
    @hunger = 10      # hungry lvl
    @happy = 10       # happy lvl
    @asleep = false   # asleep status
    @cleanliness = 0  # toilet lvl
    @life = 1         # lives
    @water = 10       # water lvl
    @lvl = 0
    @exp = 0
  end
  
  def lvlup
    if @exp >= 100
      @lvl += 1
      @exp = 0
      p "|Рівень| **#{@name} досяг ще одного рівня. #{@name} тепер #{@lvl} рівня"
    end
  end
  

  def lose_life
    @life -= 1
    p "|Життя| #{@name}  втратив одне життя" if @life != 1
    p "|Життя| #{@name}  треба нагально покормити, бо помре" if @life == 1
    p "|Життя| #{@name}  втратив останнє життя" if @life.zero?
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
      p "|Туалет| #{@name}  раптово сходив в туалет на любиму ковдру, треба частіше вигулювати"
    end
    if hungry?
      asleep_f
      rnd = rand(3)
      case rnd
      when 0
        p "|Ситність| #{@name} я хочу їсти" if @life != 0
      when 1
        p "|Ситність| #{@name}  накорми мене, пюрешечки да с котлеткой би ...." if @life != 0
      when 2
        p "|Ситність| #{@name}  накорми мене, бо з'їм тебе в ночі..." if @life != 0
      else
        p '|Ситність| - я скоро захочу їсти!'
      end
    end
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
    toilet if @cleanliness >= 8
    p "|Ситність| #{@name} поїв, ммм, дуже смачно"
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
    else
      @asleep = true
    end
  end

  def timetosleep
    p "** #{@name} солодко засипа у вас на руках ..."
    @water -= 4
    @happy -= 4
    @hunger -= 4
    @cleanliness += 4
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

  def love
    rnd = rand(5)
    case rnd
    when 0
      p "|Щастя| #{@name} дуже щасливий і обнімає вас" if @happy > 8
    when 1
      p "|Щастя| #{@name}  дуже щасливий і любить вас " if @happy > 9
    when 2
      p "|Щастя| #{@name} душі в вас нечаїть" if @happy > 10
    else
      @asleep = false
    end
  end

  def angry
    rnd = rand(6)
    case rnd
    when 0
      p "|Щастя| #{@name} розізлився на вас" if @happy < 5
    when 1
      p "|Щастя| #{@name} вкусив вас " if @happy < 3
    when 2
      p "|Щастя| #{@name} спробував на вас напасти" if @happy < 2
    else
      @asleep = false
    end
  end

  def hungry?
    @hunger < 3
  end

  def happy?
    @hunger > 3
  end

  def play
    if happy?
      rnd = rand(3)
      case rnd
      when 0
        p "|Щастя| #{@name} |грається з м'ячиком"
      when 1
        p "|Щастя| #{@name} став пілотом справжнього літака"
      when 2
        p "|Щастя| #{@name} покоряє вершину гори на подвір'ї"
      else
        p ' - Я трохи хочу відпочити!'
      end
      time_pass
      @happy += 4
      @exp += 10
    else
      p "|Щастя| #{@name} ще не має бажання гратись"
    end
  end

  def poop?
    @cleanliness >= 6
  end

  def toilet
    if poop?
      p "|Туалет| #{@name} упс, сходив в куточку в туалет"
      @cleanliness = 0
      @hunger -= 1
      @water -= 1
    else
      p "|Туалет| #{@name} скоро захоче в туалет ..."
    end
  end

  def die
    if @life.zero? || @happy <= 0
      push_html
      status
      p "『RɨP』〘#{@name}♔〙"
      p "✝✝✝ #{@name} помер, його смерть на вашій совісті ✝✝✝"
      exit
    end
  end

  def sport
    p "|Щастя| #{@name} займається спортом"
    @happy += 4
    @exp += 10
    time_pass
  end

  def swim
    p "|Щастя| #{@name} плаває в басейні"
    @happy += 5
    @exp += 10
    time_pass
  end

  def walk
    @exp += 10
    rnd = rand(3)
    p "|Щастя| #{@name} пішов гуляти на вулицю ..."
    case rnd
    when 0
      p '|Інформація| - З тобою гуляти саме заловолення!'
    when 1
      p '|Інформація| - Як сьогодні гарно на вулиці :)'
    when 2
      p '|Інформація| - А вчора ми гуляли довше!'
    else
      p '|Щастя| - щось нічого не хочеться!'
    end
    time_pass
  end
  private :time_pass
end
