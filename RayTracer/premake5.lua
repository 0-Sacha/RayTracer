
project "RayTracer"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "Off"

    targetdir 	(project_targetdir .. "/%{prj.name}")
    objdir 		(project_objdir .. "/%{prj.name}")

    files {
        "src/**.h",
        "src/**.hpp",
        "src/**.cpp"
    }

    includedirs {
        "src/"
    }

    IncludeAndLinkProject("EngineCore")
    IncludeAndLinkProject("Walnut")

    filter "system:windows"
      defines { "WL_PLATFORM_WINDOWS" }

    filter "configurations:Debug"
        defines { "WL_DEBUG" }

    filter "configurations:Release"
        defines { "WL_RELEASE" }

    filter "configurations:Dist"
        defines { "WL_DIST" }
