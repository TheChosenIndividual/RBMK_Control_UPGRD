
-- Installation program for RBMK_control.

local component = require("component")
local shell = require("shell")
if component.isAvailable("internet") then
	print("Starting Install...")
	require("filesystem").makeDirectory("/RBMK_Control")
	local setup_1 = io.open("/setup.lua")
	os.execute("wget \"https://raw.githubusercontent.com/BallOfEnergy1/RBMK_Control/master/RBMK_Control/setup.lua\" \"/setup.lua\" -f")
	local setup_2 = io.open("/setup.lua")
	if setup_2:read("*a") == "" then
		print("Failed to get setup file, reinstall the program.")
	elseif setup_1:read("*a") ~= setup_2:read("*a") then
		print("Setup file updated, rerun the setup program.")
		os.exit(0x01)
	end
	os.execute("wget \"https://raw.githubusercontent.com/BallOfEnergy1/RBMK_Control/master/RBMK_Control/funclib.lua\" \"/lib/funclib.lua\" -f")
	os.execute("wget \"https://raw.githubusercontent.com/BallOfEnergy1/RBMK_Control/master/RBMK_Control/gpulib.lua\" \"/lib/gpulib.lua\" -f")
	os.execute("wget \"https://raw.githubusercontent.com/BallOfEnergy1/RBMK_Control/master/RBMK_Control/RBMK_Monitor.lua\" \"/RBMK_Control/RBMK_Monitor.lua\" -f")
	os.execute("wget \"https://raw.githubusercontent.com/BallOfEnergy1/RBMK_Control/master/RBMK_Control/README.txt\" \"/RBMK_Control/README.txt\" -f")
	print("Verifying integrity of files...")
	local a = io.open("/lib/funclib.lua")
	local b = io.open("/RBMK_Control/RBMK_Monitor.lua")
	local c = io.open("/RBMK_Control/README.txt")
	local d = io.open("/lib/gpulib.lua")
	if a:read("*a") == "" then
		print("Failed to fetch libraries, rerun setup.")
	end
	if b:read("*a") == "" then
		print("Failed to fetch primary program, rerun setup.")
	end
	if c:read("*a") == "" then
		print("Failed to fetch documentation, rerun setup.")
	end
	if d:read("*a") == "" then
		print("Failed to fetch libraries, rerun setup.")
	end
	print("Installation complete, make sure to read the README.txt for help.")
else
	print("Internet card is required to install.")
end
