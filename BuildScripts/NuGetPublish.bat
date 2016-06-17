@echo off
pushd ".."

set NUGET=".nuget\NuGet.exe"
set PACKAGEDIR="bin\NuGetPackages"
set /p APIKEY=<ApiKey.txt

rem DryIoc
rem %NUGET% push "%PACKAGEDIR%\DryIoc.2.6.2.nupkg" -Source https://nuget.org -ApiKey %APIKEY%
rem %NUGET% push "%PACKAGEDIR%\DryIoc.dll.2.6.2.nupkg" -Source https://nuget.org -ApiKey %APIKEY%
rem %NUGET% push "%PACKAGEDIR%\DryIoc.dll.2.6.2-netcore-rc2.nupkg" -Source https://nuget.org -ApiKey %APIKEY%

rem DryIoc.AspNetCore.DependencyInjection
rem %NUGET% push "%PACKAGEDIR%\DryIoc.AspNetCore.DependencyInjection.1.0.0-rc2.nupkg" -Source https://nuget.org -ApiKey %APIKEY%

rem DryIocZero
rem %NUGET% push "%PACKAGEDIR%\DryIocZero.2.5.1.nupkg" -Source https://nuget.org -ApiKey %APIKEY%

rem DryIocAttributes
%NUGET% push "%PACKAGEDIR%\DryIocAttributes.2.6.0-pre-01.nupkg" -Source https://nuget.org -ApiKey %APIKEY%
%NUGET% push "%PACKAGEDIR%\DryIocAttributes.dll.2.6.0-pre-01.nupkg" -Source https://nuget.org -ApiKey %APIKEY%

rem DryIoc.MefAttributedModel
%NUGET% push "%PACKAGEDIR%\DryIoc.MefAttributedModel.2.6.0-pre-01.nupkg" -Source https://nuget.org -ApiKey %APIKEY%
%NUGET% push "%PACKAGEDIR%\DryIoc.MefAttributedModel.dll.2.6.0-pre-01.nupkg" -Source https://nuget.org -ApiKey %APIKEY%

rem DryIoc.SignalR
rem %NUGET% push "%PACKAGEDIR%\DryIoc.SignalR.2.0.0.nupkg" -Source https://nuget.org -ApiKey %APIKEY%
rem %NUGET% push "%PACKAGEDIR%\DryIoc.SignalR.dll.2.0.0.nupkg" -Source https://nuget.org -ApiKey %APIKEY%

rem DryIoc.SignalR
rem %NUGET% push "%PACKAGEDIR%\DryIoc.WebApi.2.1.0.nupkg" -Source https://nuget.org -ApiKey %APIKEY%
rem %NUGET% push "%PACKAGEDIR%\DryIoc.WebApi.dll.2.1.0.nupkg" -Source https://nuget.org -ApiKey %APIKEY%

rem DryIoc.Mvc
rem %NUGET% push "%PACKAGEDIR%\DryIoc.Mvc.2.0.1.nupkg" -Source https://nuget.org -ApiKey %APIKEY%
rem %NUGET% push "%PACKAGEDIR%\DryIoc.Mvc.dll.2.0.1.nupkg" -Source https://nuget.org -ApiKey %APIKEY%

rem DryIoc.Mvc
rem %NUGET% push "%PACKAGEDIR%\DryIoc.CommonServiceLocator.2.1.0.nupkg" -Source https://nuget.org -ApiKey %APIKEY%
rem %NUGET% push "%PACKAGEDIR%\DryIoc.CommonServiceLocator.dll.2.1.0.nupkg" -Source https://nuget.org -ApiKey %APIKEY%

popd
pause

echo: 
echo:Packaging succeeded.
