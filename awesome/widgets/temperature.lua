local wibox = require("wibox")
local watch = require("awful.widget.watch")

-- widget
local temp_text = wibox.widget({
	widget = wibox.widget.textbox,
})

watch("acpi -t", 3, function(_, stdout, stderr, exitreason, exitcode)
	if exitcode == 0 then
		local temp = tonumber(string.match(stdout, "([0-9]+.[0-9]+)"))

		temp_text:set_text(" " .. temp .. "Cº  ")
	else
		temp_text:set_text("Error")
	end

	collectgarbage()
end)

-- Texto de reserva en caso de error
temp_text:set_text(" ??? ")

return temp_text
