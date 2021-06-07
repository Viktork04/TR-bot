require 'telegram/bot'



class Bot
  def initialize
    token = '1763573600:AAF27kyCNs099SKpeoryQoxoKpA1gNJsMf4'

  Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'
        time = Time.at(message.date)
        bot.api.send_message(chat_id: message.chat.id, text: "Hola #{message.from.first_name}, he rebut el teu missatge el dia #{time.strftime("%d/%m/%Y a les %k:%M")}")

      when '/stop'

        bot.api.send_message(chat_id: message.chat.id, text: "Adeu, #{message.from.first_name}", date: message.date)

      else bot.api.send_message(chat_id: message.chat.id, text: "Comanda invàlida, #{message.from.first_name}, necessiteu utilitzar  /start,  /stop")
      end
    end
  end
  end
end