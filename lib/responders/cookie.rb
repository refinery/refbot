class Responders::Cookie< Responders::Base
  def action_message msg, who, full_name
    case msg
      when /^gives the bot a cookie$/, /^gives the bot a snack$/
        say_to_chan "#{who}: Nom! But, I'd rather have a contribution to Refinery"
    end
  end

  def channel_message msg, who, full_name
    case msg
      when "!botsnack"
        say_to_chan "#{who}: Nom! But, I'd rather have a contribution to Refinery"
    end
  end
end
