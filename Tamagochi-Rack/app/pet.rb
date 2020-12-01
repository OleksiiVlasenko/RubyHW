# frozen_string_literal: true

class App
  class Pet
    attr_reader :name, :stuff_in_belly, :happy, :sleep, :toilet
    attr_accessor :exit_, :message, :money, :reaction, :asd

    def initialize(name = 'Петрович')
      @name = name
      @sleep = false
      @count_sleep = 10
      @stuff_in_belly = 10
      @toilet = 0
      @happy = 10
      @exit_ = false
      @money = 0
      @message = ''
      @reaction = ''
    end

    def take_money
      time_pass
      gold = rand(1..5)
      @message += "| #{@name} наколядував #{gold} золота "
      @reaction = 'Ой вийшла Галя по водицю'
      @money += gold
      @happy += 2
    end

    def casino
      time_pass
      @message += "| У вас на рахунку : #{@money}"
      bet = rand(-10..10)
      if !@money.zero? && !@money.negative?
        if bet.positive?
          @message += "| ⓌⒾⓃ - Ви вийграли #{bet} золота "
          @money += bet
          @reaction = '| Вухуху, я виграв'
          @happy = set_change(@happy, 2)
          @message += "| У вас на рахунку: #{@money} "
        else
          @message += "| ⓁⓄⓈⒺ - Ви програли #{bet} золота "
          @money -= bet.abs
          @happy = set_change(@happy, -2)
          @reaction = '| Сумно я програв'
          @message += "| У вас на рахунку: #{@money} " if @money.positive?
          @message += "| Ви взяли в кредит: #{@money} " if @money.negative?
        end
      else
        @message += "| У вас #{@name} немає золота щоб робити ставку "
      end
    end

    def set_change(param, value)
      if param >= 1
        param.between?(0, 90) ? param + value : 100
      else
        param >= 1 ? param + value : 0
      end
    end

    def feed
      @stuff_in_belly = set_change(@stuff_in_belly, 5)
      @toilet += 5
      @message = '| Хрум хрум, вкуснятина '
      @reaction = '| ням '
      time_pass
    end

    def walk
      @happy += 2
      @reaction = '| Рум пурум пум пум'
      @message = "| Куди я йду, а з п'ятачком, великий.... "
      time_pass
      die
    end

    def put_to_bed
      @sleep = false
      @reaction = '| пішов я спати '
      @message = '| Хррр хррр хррр.... '
      3.times { time_pass }
    end

    def go_toilet
      @message = '| Дзюр дзюр дзюр.... '
      @reaction = '| ой як добре '
      @toilet = 0
      time_pass
    end

    def die
      if (@happy.zero? || @stuff_in_belly.zero?)
        @message = "| Вибачте, але ви програли, ваш </b>#{@name}</b> помер "
        @exit_ = true
      end
    end

    def push
      @reaction = ' :('
      @message = '| Я більше так не буду '
      @happy = set_change(@happy, -1)
    end

    def hungry?
      @stuff_in_belly <= 2
    end

    def mood?
      @happy.zero?
    end

    def toilet?
      @toilet >= 12
    end

    def time_pass
      # @message = ''
      if @stuff_in_belly.positive?
        @stuff_in_belly = set_change(@stuff_in_belly, -1)
      else
        @sleep = false if @sleep
        @reaction = "| #{@name} дуже голодний "
        @exit_ = true
      end
      if @happy >= 0
        @happy = set_change(@happy, -1) if @happy >= 0
      else
        @sleep = false if @sleep
        @reaction = "| #{@name} дуже засмучений "
        @happy = 0
      end
      if @toilet >= 20
        @toilet = 0
        @reaction = "| О!  #{@name} наклав велику кучу... "
      end

      if hungry?
        if @sleep
          @sleep = false
          @reaction = "| #{@name} швидко відкрив очі! "
        end
        @reaction = "| #{@name} ну прям дуже хочу їсти... "
      end

      if mood?
        @happy = set_change(@happy, -1)
        @reaction = "| #{@name} дуже злий і може скоро померти "
        @exit_ = true
      end

      if toilet?
        @reaction = "| #{@name} хоче в туалет "
      end
      die
    end
  end

  def call(env)
    req = Rack::Request.new(env)
    links = "<meta charset='utf-8'>
              <div class='container'>
              <div class='row'>
              <div class='col-sm'>
              <h4>Тамагочі від RUBOCOPS &#128293;</h4>
              </div>
              <div class='col-sm'>
                <div class='dropdown mr-1'>
                        <button type='button' class='btn btn-secondary btn-lg' id='dropdownMenuOffset' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' data-offset='260,20'>
                        &#10084;&#10084;&#10084;&#10084; Почати гру &#10084;&#10084;&#10084;&#10084;
                        </button>
              <div class='dropdown-menu' aria-labelledby='dropdownMenuOffset'>
              <a href='/walk' class='dropdown-item'>Гуляти</a>
                          <a href='/feed' class='dropdown-item'>Кормити</a>
                          <a href='/put_to_bed' class='dropdown-item'>Поспати</a>
                          <a href='/go_toilet' class='dropdown-item'>Сходити в туалет</a>
                          <a href='/push' class='dropdown-item'>Посварити</a>
                          <a href='/get_money' class='dropdown-item'>Колядувати</a>
                          <a href='/casino' class='dropdown-item'>Грати в казино</a>
                        </div>
                      </div>
              </div>
              <div class='col-sm'>
              <img src='https://cdn.icon-icons.com/icons2/2148/PNG/512/rubocop_icon_132023.png' height='50' width='50' class='rounded-circle'>
              </div>
            </div>
              </div>
                <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css' integrity='sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2' crossorigin='anonymous'>
                <script src='https://code.jquery.com/jquery-3.5.1.slim.min.js' integrity='sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj' crossorigin='anonymous'></script>
                <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js' integrity='sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN' crossorigin='anonymous'></script>
                <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js' integrity='sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s' crossorigin='anonymous'></script>"

    case req.path_info
    when /index/
      @@pet = Pet.new
      @@pet.message = "Привіт, мене звати #{@@pet.name}"
      [200, { "Content-Type" => "text/html" }, [links, "<h10><center><ul class='list-group'>",
                                                "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                                "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                                "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                                "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                                "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930231cateyes2.png' height='150' width='150'>#{@@pet.reaction}</li>",
                                                "<li class='list-group-item'> #{@@pet.message} </li>",
                                                "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center></h10>"]]
    when /walk/
      if @@pet.exit_ == true
        [404, { "Content-Type" => "text/html" }, ["<center><meta charset='utf-8'><a href='/index'>Створити нового </a>",
                                                  "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622441catpirate.png' height='150' width='150'>", "<br>",
                                                  "<br><b>", @@pet.message, "<br><b></center>"]]
        else
      @@pet.walk
      [200, { "Content-Type" => "text/html" }, [links, "<center><ul class='list-group'>",
                                                "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                                "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                                "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                                "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                                "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930286catslippers2.png' height='150' width='150'>#{@@pet.reaction}</li>",
                                                "<li class='list-group-item'> #{@@pet.message} </li>",
                                                "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center>"]]
      end
    when /feed/
      if @@pet.exit_ == true
        [404, { "Content-Type" => "text/html" }, ["<center><meta charset='utf-8'><a href='/index'>Створити нового </a>",
                                                  "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622441catpirate.png' height='150' width='150'>", "<br>",
                                                  "<br><b>", @@pet.message, "<br><b></center>"]]
      else
        @@pet.feed
        [200, { "Content-Type" => "text/html" }, [links, "<center><ul class='list-group'>",
                                                  "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                                  "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                                  "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                                  "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                                  "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930238catfish2.png' height='150' width='150'>#{@@pet.reaction}</li>",
                                                  "<li class='list-group-item'> #{@@pet.message} </li>",
                                                  "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center>"]]
      end
    when /put_to_bed/
      if @@pet.exit_ == true
        [404, { "Content-Type" => "text/html" }, ["<center><meta charset='utf-8'><a href='/index'>Створити нового </a>",
                                                  "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622441catpirate.png' height='150' width='150'>", "<br>",
                                                  "<br><b>", @@pet.message, "<br><b></center>"]]
      else
        @@pet.put_to_bed
        [200, { "Content-Type" => "text/html" }, [links, "<center><ul class='list-group'>",
                                                  "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                                  "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                                  "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                                  "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                                  "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622418catlaptop.png' height='150' width='150'>#{@@pet.reaction}</li>",
                                                  "<li class='list-group-item'> #{@@pet.message} </li>",
                                                  "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center>"]]
      end
    when /casino/
      if @@pet.exit_ == true
        [404, { "Content-Type" => "text/html" }, ["<center><meta charset='utf-8'><a href='/index'>Створити нового </a>",
                                                  "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622441catpirate.png' height='150' width='150'>", "<br>",
                                                  "<br><b>", @@pet.message, "<br><b></center>"]]
      else
        @@pet.casino
        [200, { "Content-Type" => "text/html" }, [links, "<center><ul class='list-group'>",
                                                  "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                                  "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                                  "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                                  "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                                  "<li class='list-group-item'> <img src='https://thumbs.dreamstime.com/b/%D0%BA%D0%BE%D1%82-%D0%B8%D0%B3%D1%80%D0%B0%D1%8F-%D0%BF%D0%BE%D0%BA%D0%B5%D1%80-90516704.jpg' height='150' width='150'>#{@@pet.reaction}</li>",
                                                  "<li class='list-group-item'> #{@@pet.message} </li>",
                                                  "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center>"]]
      end
    when /go_toilet/
      if @@pet.exit_ == true
        [404, { "Content-Type" => "text/html" }, ["<center><meta charset='utf-8'><a href='/index'>Створити нового </a>",
                                                  "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622441catpirate.png' height='150' width='150'>", "<br>",
                                                  "<br><b>", @@pet.message, "<br><b></center>"]]
      else
        @@pet.go_toilet
        [200, { "Content-Type" => "text/html" }, [links, "<center><ul class='list-group'>",
                                                  "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                                  "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                                  "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                                  "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                                  "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622430catpaper.png' height='150' width='150'>#{@@pet.reaction}</li>",
                                                  "<li class='list-group-item'> #{@@pet.message} </li>",
                                                  "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></li></ul></center>"]]
      end
    when /get_money/
      if @@pet.exit_ == true
        [404, { "Content-Type" => "text/html" }, ["<center><meta charset='utf-8'><a href='/index'>Створити нового </a>",
                                                  "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622441catpirate.png' height='150' width='150'>", "<br>",
                                                  "<br><b>", @@pet.message, "<br><b></center>"]]
      else
        @@pet.take_money
        [200, { "Content-Type" => "text/html" }, [links, "<center><ul class='list-group'>",
                                                  "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                                  "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                                  "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                                  "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                                  "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622468catsing.png' height='150' width='150'>#{@@pet.reaction}</li>",
                                                  "<li class='list-group-item'> #{@@pet.message} </li>",
                                                  "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></li></ul></center>"]]
      end
    when /push/
      if @@pet.exit_
        [404, { "Content-Type" => "text/html" }, ["<center><meta charset='utf-8'><a href='/index'>Створити нового </a>",
                                                  "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622441catpirate.png' height='150' width='150'>", "<br>",
                                                  "<br><b>", @@pet.message, "<br><b></center>"]]
      else
        @@pet.push
        [200, { "Content-Type" => "text/html" }, [links, "<center><ul class='list-group'>",
                                                  "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                                  "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                                  "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                                  "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                                  "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930213catbox2.png' height='150' width='150'>#{@@pet.reaction}</li>",
                                                  "<li class='list-group-item'> #{@@pet.message} </li>",
                                                  "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center>"]]
      end
    else
      @@pet = Pet.new()
      [404, { "Content-Type" => "text/html" }, ["<meta charset='utf-8'><center><ul class='list-group'>",
                                                "<h1><b>В readme ж написано перейти за посиланням!!!!!!</h1></b>",
                                                "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930250cathiss2.png' height='150' width='150'>#{@@pet.reaction}</li>",
                                                "<li class='list-group-item'> <a href='/index' >http://localhost:9292/index</a></li></ul></center>"]]

    end
  end
end
