local wibox = require("wibox")
local watch = require("awful.widget.watch")

local temp_text = wibox.widget({
	widget = wibox.widget.textbox,
})

watch("acpi -t", 5, function(_, stdout, stderr, exitreason, exitcode)
	if exitcode == 0 then
		local temp = tonumber(string.match(stdout, "([0-9]+.[0-9]+)"))

		temp_text:set_text(" " .. temp .. "Cº  ")
	else
		temp_text:set_text("Error")
	end

	collectgarbage()
end)

temp_text:set_text(" ??? ")

return temp_text
