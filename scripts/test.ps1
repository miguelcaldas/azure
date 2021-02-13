param(
    [string] $name,
    [string] [Parameter(Mandatory=$true)] $sourceUri,
    [string] [Parameter(Mandatory=$true)] $targetUri
)

$output = 'Hello {0}. The Source is {1}, the Target is {2}, the SASToken is {3}.' -f $name, $sourceUri, $targetUri, ${Env:SASToken}
Write-Output $output

Invoke-WebRequest -Uri https://mceus2sa.blob.core.windows.net/tools/linux/azcopy -OutFile azcopy -UseBasicParsing
chmod 755 azcopy

Write-Output "./azcopy copy ""$sourceUri"" ""$targetUri"" --from-to=BlobBlob --blob-type=PageBlob"
./azcopy copy "$sourceUri" "$targetUri" --from-to=BlobBlob --blob-type=PageBlob

Start-Sleep -Seconds 120

$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['text'] = $output
