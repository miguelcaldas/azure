param([string] $name)

$output = 'Hello {0}. The username is {1}, the password is {2}.' -f $name, ${Env:SASToken}, ${Env:Password}
Invoke-WebRequest -Uri https://mceus2sa.blob.core.windows.net/tools/linux/azcopy -OutFile azcopy -UseBasicParsing
chmod 755 azcopy

Write-Output $output

./azcopy copy "${Env:Source}" "${Env:Target}?${Env:SASToken}" --from-to=BlobBlob --blob-type=PageBlob --put-md5

$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['text'] = $output
