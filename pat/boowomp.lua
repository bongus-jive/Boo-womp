local pane = { gui = {}, scripts = { "/pat/boowomp_sound.lua" } }
local boowomping

function init()
  script.setUpdateDelta(10)
end

function update()
  local sad = currentEmote() == "sad"
  if sad and not boowomping then
    player.interact("ScriptPane", pane)
  end
  boowomping = sad
end

function currentEmote()
  if player.currentEmote then
    return player.currentEmote():lower()
  end

  for _, d in ipairs(world.entityPortrait(player.id(), "head")) do
    local emote = d.image:match("emote%.png:(.+)%.")
    if emote then return emote end
  end
end
