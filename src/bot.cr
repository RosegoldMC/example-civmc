require "rosegold-civmc"

bot = Rosegold::CivMC::Bot.new(ENV["SERVER_ADDRESS"]? || Rosegold::CivMC::DEFAULT_ADDRESS)
begin
  bot.join_game
  puts "Connected as #{bot.username}. Hello!"
ensure
  bot.disconnect("Example complete")
end
