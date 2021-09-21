function init()
	if pane then
		script.setUpdateDelta(0)
		pane.playSound("/pat/boowomp.ogg")
		pane.dismiss()
	else
		script.setUpdateDelta(10)
		boowomped = false
	end
end

function update(dt)
	for _,v in ipairs(world.entityPortrait(player.id(), "head")) do
		sb.logInfo(v.image)
		
		if string.find(v.image, "emote.png:") then
			local sad = string.find(v.image, "emote.png:sad.")
			
			if sad then
				if not boowomped then
					boowomped = true
					
					player.interact("ScriptPane", {gui = {}, scripts = {"/pat/boowomp.lua"}})
				end
			else
				boowomped = false
			end
			
			break
		end
	end
end
