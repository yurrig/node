setlocal
call %~dp0..\vc_setup.cmd
set PATH=%PATH%;%DEPS%
title Building Node Debug
call vcbuild debug
title Building Node Release
call vcbuild release
title Done building Node
PdbIndexer %DEPS_SOURCE_URL%/node
NuGet.exe pack NodeJS.nuspec -OutputDirectory %PACKAGES%\nuget_packages
NuGet.exe pack NodeJS.Dbg.nuspec -OutputDirectory %PACKAGES%\nuget_packages
NuGet.exe pack NodeJS.Dbg.Pdb.nuspec -OutputDirectory %PACKAGES%\nuget_packages
NuGet.exe pack NodeJS.Rel.nuspec -OutputDirectory %PACKAGES%\nuget_packages
endlocal
