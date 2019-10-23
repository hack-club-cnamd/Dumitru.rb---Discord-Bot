require 'discordrb'

TOKEN = 'nahbro'
CLIENTID = '629770485516992528'
GENERAL = '624601637545050114'

bot = Discordrb::Bot.new token: TOKEN, client_id: CLIENTID

# function to get a specific word in a string
def findARG(thing, index)

  aux = thing.strip.downcase
  result = aux.split

  first_word = result[0]
  second_word = result[1]

  len = first_word.length

  if index == 0 && first_word.start_with?("!")
    target = first_word.slice(1..len)
    return target
  end

  if index == 1
    return second_word
  end
end


bot.message do |event|

  emc = event.message.content       # message content

  msg = findARG(emc, 0)             # first word in the message
  arguments = findARG(emc, 1).to_i  # second word in the message

  if msg === 'random'

    if findARG(emc, 1) == nil
      arguments = 100
    end

    randomNumber = rand(1..arguments)
    event.respond randomNumber.to_s

    if randomNumber == 69
      event.respond 'nice'
    end

  end

  if msg === 'hello'
    event.respond "Hello #{event.user.name}!"
  end

end

bot.run

# bot.send_message("624601637545050114", secretcode)
