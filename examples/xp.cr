require "rosegold-civmc"

item_name = ENV.fetch("XP_ITEM")
target_level = ENV.fetch("TARGET_LEVEL").to_i
bot = Rosegold::CivMC::Bot.new(ENV["SERVER_ADDRESS"]? || Rosegold::CivMC::DEFAULT_ADDRESS)
begin
  bot.join_game
  result = bot.raise_level_with(item_name, target_level)
  puts "#{result.reason}: level #{result.final_level}"
ensure
  bot.disconnect("Example complete")
end
