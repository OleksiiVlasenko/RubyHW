
class App

  class Pet
    attr_reader :name, :stuff_in_belly, :happy, :sleep, :toilet
    attr_accessor :exit_, :message, :money

    def initialize name
      @name = name
      @sleep = false      #желание сна
      @count_sleep = 10   #колличество бодрстволвания
      @stuff_in_belly = 10 #  желудок
      @toilet = 0
      @happy = 10 # Настроение
      @exit_ = false
      @money = 1
      @message = ''
    end

    def get_money
      gold = rand(1..5)
      @message = " #{@name} наколядував #{gold} золота"
      @money += gold
      @happy += 2
      time_pass
    end

    def casino
      p ' - ⒸⒶⓈⒾⓃⓄ - '
      p "У вас на рахунку : #{@money}"
      bet = rand(-10..10)
      if !@money.zero? && !@money.negative?
        p "Ставка : #{bet}"
        if bet.positive?
          p "|Золото| - ⓌⒾⓃ - Ви вийграли #{bet} золота"
          @money += bet
          p "У вас на рахунку: #{@money}"
          p 'Щоб продовжити грати напишіть 13, загальний список команд 12'
        else
          p "|Золото| - ⓁⓄⓈⒺ - Ви програли #{bet} золота"
          @money -= bet.abs
          p "У вас на рахунку: #{@money}" if @money.positive?
          p "Ви взяли в кредит: #{@money}" if @money.negative?
          p 'Щоб продовжити грати напишіть 13, загальний список команд 12'
        end
      else
        p "|Золото| У вас #{@name} немає золота щоб робити ставку"
      end
    end

    def feed
      @message = ' Хрум хрум, вкуснятина '
      @stuff_in_belly += 5
      @toilet += 5
      time_pass
    end

    def walk
      @message = " Куди я йду, а з п'ятачком, великий.... "
      @happy += 2
      time_pass
    end

    def put_to_bed
      @message = ' Хррр хррр хррр.... '
      @sleep = false
      3.times { time_pass }
    end

    def go_toilet
      @message = ' Дзюр дзюр дзюр.... '
      time_pass
      @toilet = 0
    end

    def die
      @message = " Вибачте, але ви програли, ваш </b>#{@name}</b> помер " if @happy <= 5 && @stuff_in_belly <= 0
    end

    def push
      @message = ' Я більше так не буду '
      @happy -= 1
      time_pass
    end


    def hungry?
      @stuff_in_belly <= 2
    end

    def mood?
      @happy == 0
    end

    def toilet?
      @toilet >= 8
    end

    def time_pass
      if @stuff_in_belly > 0
        @stuff_in_belly -= 1
        @toilet += 1 if @stuff_in_belly >= 0
      else
      @sleep = false if @sleep
      @message += " #{@name} дуже голодний "
      @exit_ = true
      end
      if @happy > 0
        @happy -= 1
        @toilet += 1
      else
        @sleep = false if @sleep
        @message += " #{@name} дуже засмучений "
        @exit_ = true
      end
      if @toilet >= 20
        @toilet = 0
        @message += " О!  #{@name} наклав велику кучу... "
      end

      if hungry?
        if @sleep
          @sleep = false
          @message += " #{@name} швидко відкрив очі! "
        end
        @message += " #{@name} ну прям дуже хочу їсти... "
      end

      if mood?
        @happy -= 1
        @message += " #{@name} дуже злий "
        @exit_ = true
      end

      if toilet?
        if @sleep
          @sleep = false
          @message += " #{@name} відкрива очі! "
        end
        @message += " #{@name} хоче в туалет "
        @message += " #{@name} хоче в туалет "
      end
      die
    end
  end

  def call(env)
    req = Rack::Request.new(env)
    links = "<center><meta charset='utf-8'>
              <div class='list-group'>
                <a href='/walk' class='list-group-item list-group-item-action list-group-item-primary'>Гуляти</a>
                <a href='/feed' class='list-group-item list-group-item-action list-group-item-success'>Кормити</a>
                <a href='/put_to_bed' class='list-group-item list-group-item-action list-group-item-dark'>Поспати</a>
                <a href='/go_toilet' class='list-group-item list-group-item-action list-group-item-warning'>Сходити в туалет</a>
                <a href='/push' class='list-group-item list-group-item-action list-group-item-danger'>Посварити</a>
                <a href='/get_money' class='list-group-item list-group-item-action list-group-item-danger'>Колядувати</a>
              </div>
                <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css' integrity='sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2' crossorigin='anonymous'>
                <script src='https://code.jquery.com/jquery-3.5.1.slim.min.js' integrity='sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj' crossorigin='anonymous'></script>
                <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js' integrity='sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN' crossorigin='anonymous'></script>
                <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js' integrity='sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s' crossorigin='anonymous'></script>
              </center>"

    case req.path_info
    when /index/
      @@pet = Pet.new('Петрович')
      [200, {"Content-Type" => "text/html"}, [links, "<h10><center><ul class='list-group'>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                              "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930231cateyes2.png' height='150' width='150'>#{@@pet.message}</li>",
                                              "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center></h10>"]]

    when /walk/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Новий тамагочі     </a>",
                                                "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622365catacrobat.png' height='150' width='150'  ' height='150' width='150'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.walk
      [200, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                              "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930286catslippers2.png' height='150' width='150'>#{@@pet.message}</li>",
                                              "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center>"]]
    when /feed/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Новий тамагочі     </a>",
                                                "<img src='/media/go_to_les.jpg' height='150' width='150'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.feed
      [200, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                              "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930238catfish2.png' height='150' width='150'>#{@@pet.message}</li>",
                                              "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center>"]]
    when /put_to_bed/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Новий тамагочі     </a>",
                                                "<img src='/media/go_to_les.jpg' height='150' width='150'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.put_to_bed
      [200, {"Content-Type" => "text/html"},  [links, "<center><ul class='list-group'>",
                                               "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                               "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                               "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                               "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                               "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622418catlaptop.png' height='150' width='150'>#{@@pet.message}</li>",
                                               "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center>"]]
    when /go_toilet/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Новий тамагочі     </a>",
                                                "<img src='/media/go_to_les.jpg' height='150' width='150'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.go_toilet
      [200, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                              "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622430catpaper.png' height='150' width='150'>#{@@pet.message}</li>",
                                              "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></li></ul></center>"]]
    when /get_money/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<a href='/index' >Новий тамагочі     </a>",
                                                "<img src='/media/go_to_les.jpg' height='150' width='150'>","<br>",
                                                "<br><b>",@@pet.message,"<br><b>"]]
      end
      @@pet.get_money
      [200, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                              "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622468catsing.png' height='150' width='150'>#{@@pet.message}</li>",
                                              "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></li></ul></center>"]]
    when /push/
      if @@pet.exit_
        [404, {"Content-Type" => "text/html"}, ["<center><meta charset='utf-8'><a href='/index'>Створити нового </a>",
                                                "<img src='http://s1.iconbird.com/ico/2013/9/430/w128h1281378622441catpirate.png' height='150' width='150'>","<br>",
                                                "<br><b>", @@pet.message, "<br><b></center>"]]
      else
        @@pet.push
        [200, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                                "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                                "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                                "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                                "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                                "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930213catbox2.png' height='150' width='150'>#{@@pet.message}</li>",
                                                "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center>"]]
      end

    else
      @@pet.message = "#{@@pet.name} не понимает что вы от неё хотите"
      [404, {"Content-Type" => "text/html"}, [links, "<center><ul class='list-group'>",
                                              "<li class='list-group-item'> Ситність: #{@@pet.stuff_in_belly}</li>",
                                              "<li class='list-group-item'> Туалет: #{@@pet.toilet}</li>",
                                              "<li class='list-group-item'> Щастя: #{@@pet.happy}</li>",
                                              "<li class='list-group-item'> Золото: #{@@pet.money}</li>",
                                              "<li class='list-group-item'> <img src='http://s1.iconbird.com/ico/2013/8/428/w128h1281377930250cathiss2.png' height='150' width='150'>#{@@pet.message}</li>",
                                              "<li class='list-group-item'> <a href='/index' >Нова гра</a></li></ul></center>"]]

    end
  end
end