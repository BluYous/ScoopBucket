param([Parameter(Mandatory)][String] $dir, [Parameter(Mandatory)][String] $bucketsdir)

$current = (Split-Path $dir | Join-Path -ChildPath 'current') -replace '\\', '/'
$bucketsdir = $bucketsdir -replace '\\', '/'

$CONT = Get-Content "$dir\IDE\bin\idea.properties"
$CONT = $CONT -replace '^#\s*(idea.config.path=).*$', "`$1$current/profile/config"
$CONT = $CONT -replace '^#\s*(idea.system.path=).*$', "`$1$current/profile/system"
$CONT = $CONT -replace '^#\s*(idea.plugins.path=).*$', '$1${idea.config.path}/plugins'
$CONT = $CONT -replace '^#\s*(idea.log.path=).*$', '$1${idea.system.path}/log'
Set-Content -LiteralPath "$dir\IDE\bin\idea.properties" -Value $CONT -Encoding 'Ascii' -Force

$CONT = Get-Content "$dir\IDE\bin\idea64.exe.vmoptions"
$totalPhysicalMemory = (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory
$minMemory = $totalPhysicalMemory / 1mb * 0.05 -as [int]
$maxMemory = $totalPhysicalMemory / 1mb * 0.2 -as [int]
$CONT = $CONT -replace '^-Xms[0-9]+m$', "-Xms${minMemory}m"
$CONT = $CONT -replace '^-Xmx[0-9]+m$', "-Xms${maxMemory}m"
$CONT += "-javaagent:$bucketsdir/BluYousScoopBucket/assets/ja-netfilter-all/ja-netfilter.jar=jetbrains"
$CONT += "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED"
$CONT += "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED"
$CONT += "-Dfile.encoding=UTF-8"
Set-Content -LiteralPath "$dir\IDE\bin\idea64.exe.vmoptions" -Value $CONT -Encoding 'Ascii' -Force
