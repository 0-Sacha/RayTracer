
Solution.Projects["RayTracer"].ProjectDependencies = {
	"ProjectCore",
    "Walnut"
}

project "RayTracer"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "Off"

    targetdir 	(Solution.Path.ProjectTargetDirectory)
	objdir 		(Solution.Path.ProjectObjectDirectory)

    files {
        "src/**.h",
        "src/**.hpp",
        "src/**.cpp"
    }

    includedirs {
        "src/"
    }

    Solution.Project("RayTracer")
        