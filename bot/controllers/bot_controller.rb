class BotController < Stealth::Controller

  helper :all

  def route
    puts current_session.inspect
    puts current_message.inspect
    if current_message.payload.present?
      # do step_to the flow
      case current_message.payload
      when "some_button"
        puts "Some Button pressed"
        return
      when /\A(?<flow>[a-z_]+)->(?<state>[a-z_]+)\z/
        step_to flow: $~[:flow], state: $~[:state]
      else
        puts "Go ahead"
      end
    end

    if current_session.present?
      step_to session: current_session
    else
      step_to flow: 'hello', state: 'say_hello'
    end
  end

end
