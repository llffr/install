local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local internet_widget = {}

local function worker(args)
	args = args or {}
	local timeout = args.timeout or 5
	local onclick = args.onclick

	local widget = wibox.widget({
		text = "Checking...",
		widget = wibox.widget.textbox,
	})

	local function update_status()
		awful.spawn.easy_async_with_shell(
			"ping -c 1 8.8.8.8 >/dev/null 2>&1 && echo online || echo offline",
			function(stdout)
				if stdout:match("online") then
					widget.text = ""
				else
					widget.text = " OFF "
				end
			end
		)
	end

	-- Initial check
	update_status()

	-- Setup a timer to refresh the status
	gears.timer({
		timeout = timeout,
		call_now = true,
		autostart = true,
		callback = update_status,
	})

	-- Bind onclick event
	if onclick then
		widget:buttons(gears.table.join(awful.button({}, 1, function()
			awful.spawn(onclick)
		end)))
	end

	return widget
end

return setmetatable(internet_widget, {
	__call = function(_, ...)
		return worker(...)
	end,
})
