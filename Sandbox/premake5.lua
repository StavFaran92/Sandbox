IncludeDir = {}
IncludeDir["GLFW"] = "%{prj.location}/vendor/glfw/include/GLFW"
IncludeDir["ImGui"] = "%{prj.location}/vendor/ImGui"

project "Sandbox"
    kind "ConsoleApp"
    language "C++"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")
	
	files 
	{ 
		"src/**.h", 
		"src/**.cpp"
	}
	
	includedirs
	{
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.ImGui}",
	}
	
	links
	{
		"GLFW",
		"ImGui"
	}
   
	filter {"system:windows", "action:vs*"}
		systemversion(os.winSdkVersion() .. ".0")

	filter { "configurations:Debug" }
      defines { "DEBUG" }
      symbols "On"

	filter { "configurations:Release" }
      defines { "NDEBUG" }
      optimize "On"
	  