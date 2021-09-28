--Used to build to Win10
function os.winSdkVersion()
    local reg_arch = iif( os.is64bit(), "\\Wow6432Node\\", "\\" )
    local sdk_version = os.getWindowsRegistry( "HKLM:SOFTWARE" .. reg_arch .."Microsoft\\Microsoft SDKs\\Windows\\v10.0\\ProductVersion" )
    if sdk_version ~= nil then return sdk_version end
end

--Solution
workspace "gui_Playground"
	architecture "x86_64"
	startproject "Hazelnut"
	
    configurations 
	{ 
		"Debug", 
		"Release" 
	}
   
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

--Include other premakes
include "Sandbox"

group "Dependencies"
	include "Sandbox/vendor/GLFW"
	include "Sandbox/vendor/imgui"
	include "Sandbox/vendor/glad"
group ""
	  
	