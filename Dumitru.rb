require 'discordrb'

TOKEN = 'NjI5NzcwNDg1NTE2OTkyNTI4.XbMVLQ.o2hkCEvTmBYB62t0S3irHm7TtPM'
CLIENTID = '629770485516992528'
GENERAL = '624601637545050114'
GENERAL2 = '638834555780071442'
PLAYGR = '636622230112960512'
PREFIX = '$'
NAME = 'csharp'

bot = Discordrb::Bot.new token: TOKEN, client_id: CLIENTID

# function to get a specific word in a string #
def findARG(thing, index)

  aux = thing.strip.downcase
  result = aux.split

  first_word = result[0]
  len = first_word.length

  if index == 0 && first_word.start_with?(PREFIX)
    target = first_word.slice(1..len)
    return target
  elsif index != 0
    return result[index]
  end
end

def monthName(monthNum)
  case monthNum
  when 1
    return "January - Ianuarie"
  when 2
    return "February - Februarie"
  when 3
    return "March - Martie"
  when 4
    return "April - Aprilie"
  when 5
    return "May - Mai"
  when 6
    return "June - Iunie"
  when 7
    return "July - Iulie"
  when 8
    return "August - August"
  when 9
    return "September - Septembrie"
  when 10
    return "October - Octombrie"
  when 11
    return "November - Noiembrie"
  when 12
    return "December - Decembrie"
  else
    return "Something went wrong (parameter)"
  end
end

bot.message do |event|

  emc = event.message.content    # message content #

  arg1 = findARG(emc, 1)
  arg2 = findARG(emc, 2)
  arg3 = findARG(emc, 3)
  arg4 = findARG(emc, 4)
  arg5 = findARG(emc, 5)
  arg6 = findARG(emc, 6)

  msg = findARG(emc, 0)          # first word in the message        #
  argNum1 = arg1.to_i            # number for the random command    #
  argNum2 = arg2.to_i            # first num for the random command #

  if msg === 'random'
    # no arguments means that the range is 100 by default #
    if arg1 == nil
      argNum1 = 100
    end

    # two arguments means that the random nr is between 2 values #
    if arg2 != nil && arg3 == nil

      randomNumber = rand(argNum1..argNum2)
      event.respond randomNumber.to_s

      if randomNumber == 69
        event.respond 'nice'
      end

    # three arguments will send a message #
    elsif arg3 != nil
      event.respond "The random function won't work with more than 2 arguments"

    # one argument is the max limit for the random number ( 0 - arg ) #
    else
      randomNumber = rand(1..argNum1)
      event.respond randomNumber.to_s

      if randomNumber == 69
        event.respond 'nice'
      end
    end

  end

  # hello command #
  if msg === 'hello'
    event.respond "Hello #{event.user.name}!"
  end

  # DM ing the bot with the !@ command #
  if msg === '@' && event.user.name == NAME
    sentence = arg1.to_s + " " + arg2.to_s + " " +
               arg3.to_s + " " + arg4.to_s + " " +
               arg5.to_s + " " + arg6.to_s

    bot.send_message(PLAYGR, sentence)
  end

  # TIME COMMAND #
  if msg === 'time'

    time = Time.now.to_s.slice(0..18)

    year = time.slice(0..3)
    month = time.slice(5..6)
    day = time.slice(8..9)
    hour = time.slice(11..12)
    minute = time.slice(14..15)
    second = time.slice(17..18)

    lastDigitDay = day.to_i % 10
    numeLuna = monthName(month.to_i)

    case lastDigitDay
    when 1
      sufix = 'st'
    when 2
      sufix = 'nd'
    when 3
      sufix = 'rd'
    else
      sufix = 'th'
    end

    case arg1
    when 'year'
      event.respond "The year is #{year}"
    when 'month'
      event.respond "The month is #{month} (#{numeLuna})"
    when 'day'
      event.respond "Today is the #{day + sufix}"
    when 'hour'
      event.respond "It's #{hour} o'clock"
    when 'minute'
      event.respond "The minute is #{minute}"
    when 'second'
      event.respond "The second right now is #{second}"
    else
      event.respond "The time is #{time}"
    end

  end

end

bot.run
