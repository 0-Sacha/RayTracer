workspace "RayTracer"
    platforms { "x64" }
    configurations { "Debug", "Release", "Dist" }

    startproject "RayTracer"

    flags "MultiProcessorCompile"


include "PremakeUtilities/Utilities.lua"

-- Include directories relative to WKS
Solution.Name  = "RayTracer"
Solution.AddProject("ProjectCore", "%{wks.location}/ProjectCore/")
Solution.AddProject("Walnut",      "%{wks.location}/Walnut/")

include "ProjectCore"
include "Walnut"

Solution.AddProject("RayTracer",   "RayTracer/")

Solution.Projects["RayTracer"].ProjectDependencies = {
    "ProjectCore",
    "Walnut"
}

project "RayTracer"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "Off"

    targetdir   (Solution.Path.ProjectTargetDirectory)
    objdir      (Solution.Path.ProjectObjectDirectory)

    files {
        "src/**.h",
        "src/**.hpp",
        "src/**.cpp"
    }

    includedirs {
        "src/"
    }

    Solution.Project("RayTracer")
