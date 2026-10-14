require "rosegold-civmc"

target_y = ENV.fetch("TARGET_Y").to_f64
bot = Rosegold::CivMC::Bot.new(ENV["SERVER_ADDRESS"]? || Rosegold::CivMC::DEFAULT_ADDRESS)
begin
  bot.join_game
  bot.elevator(target_y)
  puts "Arrived at Y=#{bot.y}"
ensure
  bot.disconnect("Example complete")
end
