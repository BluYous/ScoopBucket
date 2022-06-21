param([Parameter(Mandatory)][String] $dir, [Parameter(Mandatory)][String] $bucketsdir)

$bucketsdir = $bucketsdir -replace '\\', '/'

$CONT = Get-Content "$dir\dbeaver.ini"
$CONT += "-javaagent:$bucketsdir/BluYousScoopBucket/assets/dbeaver-agent/dbeaver-agent.jar"
$CONT += "-Dlm.debug.mode=true"
Set-Content -LiteralPath "$dir\dbeaver.ini" -Value $CONT -Encoding 'Ascii' -Force

Remove-Item -Force -Recurse "$dir\jre"
