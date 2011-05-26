class Responders::Cookie< Responders::Base
  def action_message msg, who, full_name
    case msg
      when /^gives the bot a cookie$/, /^gives the bot a snack$/, /\!botsnack$/
        say_to_chan "I'd rather have a contribution to Refinery"
    end
  end
end
