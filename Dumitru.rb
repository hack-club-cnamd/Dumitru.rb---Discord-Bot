require 'discordrb'

TOKEN = 'NjI5NzcwNDg1NTE2OTkyNTI4.XbG5xA.-YUa7eEX8_DWA_qPAK55oKs7ZhU'
CLIENTID = '629770485516992528'
GENERAL = '624601637545050114'

bot = Discordrb::Bot.new token: TOKEN, client_id: CLIENTID

# function to get a specific word in a string #
def findARG(thing, index)

  aux = thing.strip.downcase
  result = aux.split

  first_word = result[0]
  len = first_word.length

  if index == 0 && first_word.start_with?("!")
    target = first_word.slice(1..len)
    return target
  else
    return result[index]
  end
end


bot.message do |event|

  emc = event.message.content   # message content #

  arg1 = findARG(emc, 1)
  arg2 = findARG(emc, 2)
  arg3 = findARG(emc, 3)
  arg4 = findARG(emc, 4)

  msg = findARG(emc, 0)         # first word in the message        #
  argNum1 = arg1.to_i           # number for the random command    #
  argNum2 = arg2.to_i           # first num for the random command #

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
  if msg === '@' && event.user.name == 'csharp'
    sentence = arg1.to_s + " " + arg2.to_s + " " + arg3.to_s + " " + arg4.to_s
    bot.send_message(GENERAL, sentence)
  end

end

bot.run
