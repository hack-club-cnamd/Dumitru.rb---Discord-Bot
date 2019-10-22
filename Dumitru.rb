require 'discordrb'

TOKEN = 'NjI5NzcwNDg1NTE2OTkyNTI4.Xa79TA.y2hVh_xqwHoa4TiQMMFEjEmSOj8'
CLIENTID = 629770485516992528

bot = Discordrb::Bot.new token: TOKEN, client_id: CLIENTID

# function to get the second word in a string
def findARG(message, index)
  aux = message.strip.downcase
  result = aux.split
  return result[index]
end

receivedMsg = ''
bot.message(with_text: receivedMsg) do |event|

  msg = findARG(receivedMsg, 0)        # first word in the message
  arguments = findARG(receivedMsg, 1)  # second word in the message

  if msg === 'random'
    randomNumber = rand(1..arguments.to_i)
    event.respond randomNumber.to_s

    if randomNumber == 69
      event.respond 'nice'
    end
  end

end

bot.run
