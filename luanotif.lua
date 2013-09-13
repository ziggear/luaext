luanotif = {}

local objs = {}

function luanotif.reg(obj, notify_name, action_name)
	local an_obj = {}
	an_obj["object"] = obj
	an_obj["notify"] = notify_name
	an_obj["action"] = action_name
	table.insert(objs, an_obj)
	print("notify: register object ", obj, " action ", action_name, " with notification ", notify_name)
	return
end

function luanotif.post(notify_name, send_obj)
	local i = 1
	while objs[i] do
		if objs[i]["notify"] == notify_name then
			print("notify: received notify name ",objs[i]["notify"]) 
			print("notify: received data ", send_obj)
			f = objs[i]["object"][objs[i]["action"]]
			if (f and send_obj) then
				f(send_obj)
			end
		end
		i = i + 1
	end
	return
end

return luanotif

