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
Solution.AddProject("RayTracer",   "%{wks.location}/RayTracer/")

include "ProjectCore"
include "Walnut"
include "RayTracer"
