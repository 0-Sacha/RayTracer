workspace "RayTracer"
	platforms { "x64" }
	configurations { "Debug", "Release", "Dist" }

	startproject "RayTracer"

	flags "MultiProcessorCompile"


include "PremakeUtilities/Utilities.lua"

-- Include directories relative to WKS
Solution.Name  = "RayTracer"
Solution.Projects["ProjectCore"] 	= "%{wks.location}/ProjectCore/"
Solution.Projects["Walnut"] 		= "%{wks.location}/Walnut/"
Solution.Projects["RayTracer"] 		= "%{wks.location}/RayTracer/"

include "ProjectCore"
include "Walnut"
include "RayTracer"
