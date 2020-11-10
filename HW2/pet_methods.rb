def status
  p "Статус #{@type}  #{@name}"
  p "Ситність    : #{@hunger}"
  p "Щастя       : #{@happy}"
  p "Туалет      : #{@cleanliness}"
  p "К-ть життів : #{@live}"
end

def time_pass
  if @hunger >= 0
    @hunger -= 1
    @happy -= 1
    @cleanliness += 1
  else
    asleep_f if @asleep
    @live -= 1
    p "** #{@name} втратив одне життя" if @live == 1
    p "** #{@name} втратив останнє життя" if @live.zero?
    p "** #{@name} треба нагально покормити, бо помре" if @live.zero?
  end
  if @cleanliness >= 10
    @cleanliness = 0
    p "** #{@name} раптово сходив в туалет на любиму ковдру, треба частіше вигулювати"
  end
  asleep_f if hungry?
  rnd = rand(3)
  case rnd
  when 0
    p "** #{@name} я хочу їсти" if @hunger.positive?
  when 1
    p "** #{@name} пюрешечки да с котлеткой би ...." if @hunger.positive?
  when 2
    p "** #{@name} накорми мене ..." if @hunger.positive?
  else
    p ' - Я не буду з тобою більше гуляти!'
  end
  die
  angry
end
def feed
  @hunger += 2
  @cleanliness += 2
  p "** #{@name} ммм, дуже смачно"
  toilet
end

def asleep_f
  @asleep = false
  rnd = rand(3)
  case rnd
  when 0
    p "** #{@name} невпинно дивиться на вас" if @live != 0
  when 1
    p "** #{@name} підійшов по ближче і дивиться вам в очі" if @live != 0
  when 2
    p "** #{@name} почина відкривати очі після короткого сну" if @live != 0
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
    p ' - Я не буду з тобою більше гуляти!'
  end
end

def hungry?
  @hunger < 5 ? true : false
end

def happy?
  @happy < 5 ? true : false
end

def play
  time_pass
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
  @cleanliness >= 10
end

def toilet
  if poop?
    p "** #{@name} упс, сходив в куточку в туалет"
    @cleanliness = 0
    @hunger -= 2
  else
    p "** #{@name} я скоро захочу в туалет"
  end
end

def new_pet
  p " - Вітаю мій господарю, мене звати #{@name}, хочу нагадати що я видатна тваринка із сімейства #{@type}"
end

def die
  if @live.zero?
    p "『RɨP』〘#{@name}♔〙"
    p "✝✝✝ #{@name} помер, його смерть на вашій совісті ✝✝✝"
    exit
  end
end

def kill
  @live = 0
  die
end
def sport
  time_pass
  @happy += 2
  @hunger -= 2
end

def swim
  time_pass
  @happy += 3
  @hunger -= 2
end

private

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

private :die, :walk, :happy?, :poop?, :toilet, :status, :hungry?, :poop?, :status, :timetosleep, :time_pass, :feed,
        :play, :asleep_f, :sport, :swim, :new_pet, :kill