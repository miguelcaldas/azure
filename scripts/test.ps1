param([string] $name)

$output = 'Hello {0}. The username is {1}, the password is {2}.' -f $name, ${Env:UserName}, ${Env:Password}
Write-Output $output
$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['text'] = $output
