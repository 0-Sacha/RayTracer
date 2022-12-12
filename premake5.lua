
-- WARNIG : need to change the target / obj dir for ImGui and GLFW || Wait for new UI interface --

workspace "RayTracer"
	platforms { "x64" }
	configurations { "Debug", "Release", "Dist" }
	startproject "RayTracer"

	flags "MultiProcessorCompile"


include "Helper.lua"

-- Defines

-- Include directories relative to WKS
ProjectName = "RayTracer"
Project["EngineCore"] 	= "%{wks.location}/EngineCore/"
Project["Walnut"] 		= "%{wks.location}/Walnut/"
Project["RayTracer"] 	= "%{wks.location}/RayTracer/"

include "EngineCore"
include "Walnut"
include "RayTracer"

filter "action:vs*"
    CleanVSfiles()