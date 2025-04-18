--
-- An example teleport command using Rocket.
-- This showcases:
--  - Command Usages
--  - Tab Completion
--  - The Player API
--

commands.new()
  .name("teleport")
  .description("Teleport to a player")
  .usage("<red>/teleport <player>")
  .executor(function(sender, args)
    local target = players.get(args[1])

    if (target == nil) then
      sender.send("<red>This player is offline.")
      return
    end

    sender.teleport(target.location)
    sender.send("<green>Teleported to " .. sender.name)
  end)
  .tabCompleter(function(sender, args)
    local names = {}
    for i, player in ipairs(players.getAll()) do
      table.insert(names, player.name)
    end
    return names
  end)
  .argCount(1)
  .register()