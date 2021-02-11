param([string] $name)

$output = 'Hello {0}. The username is {1}, the password is {2}.' -f $name, ${Env:SASToken}, ${Env:Password}
Write-Output $output
azcopy
$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['text'] = $output
