IncludeDir = {}
IncludeDir["GLFW"] = "%{prj.location}/vendor/glfw/include/GLFW"
IncludeDir["ImGui"] = "%{prj.location}/vendor/ImGui"
IncludeDir["glad"] = "%{prj.location}/vendor/glad/include"

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
		"%{IncludeDir.glad}"
	}
	
	links
	{
		"GLFW",
		"ImGui",
		"glad"
	}
	
	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"GLFW_INCLUDE_NONE"
	}
   
	filter {"system:windows", "action:vs*"}
		systemversion(os.winSdkVersion() .. ".0")

	filter { "configurations:Debug" }
      defines { "DEBUG" }
      symbols "On"

	filter { "configurations:Release" }
      defines { "NDEBUG" }
      optimize "On"
	  