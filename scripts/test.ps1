param([string] $name)

$output = 'Hello {0}. The username is {1}, the password is {2}.' -f $name, ${Env:Target}, ${Env:SASToken}
Write-Output $output

Invoke-WebRequest -Uri https://mceus2sa.blob.core.windows.net/tools/linux/azcopy -OutFile azcopy -UseBasicParsing
chmod 755 azcopy



./azcopy copy "${Env:Source}" "${Env:Target}?${Env:SASToken}" --from-to=BlobBlob --blob-type=PageBlob
Write-Output './azcopy copy "${Env:Source}" "${Env:Target}?${Env:SASToken}" --from-to=BlobBlob --blob-type=PageBlob'

$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['text'] = $output
