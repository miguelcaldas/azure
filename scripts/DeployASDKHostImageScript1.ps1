param(
    [string] $name,
    [string] [Parameter(Mandatory=$true)] $sourceUri,
    [string] [Parameter(Mandatory=$true)] $targetUri,
    [string] [Parameter(Mandatory=$true)] $targetSasToken
)

Write-Output "Hello ${name}. The Source is ${sourceUri}, the Target is ${targetUri}, the TargetSasToken is ${targetSasToken}."

Invoke-WebRequest -Uri https://mceus2sa.blob.core.windows.net/tools/linux/azcopy -OutFile azcopy -UseBasicParsing
chmod 755 azcopy

Write-Output "./azcopy copy ""${sourceUri}"" ""${targetUri}?${targetSasToken}"" --from-to=BlobBlob --blob-type=PageBlob"
./azcopy copy "${sourceUri}" "${targetUri}?${targetSasToken}" --from-to=BlobBlob --blob-type=PageBlob

Write-Output "Waiting 180 seconds"
Start-Sleep -Seconds 180
# for ($num = 1; $num -le 1000; $num++) {
#     $sc = (Invoke-WebRequest -Uri "$targetUri" -Method Head -SkipHttpErrorCheck).StatusCode
#     Write-Output "HTTP Status $sc"
#     if ($sc -ne 200) {
#         Write-Output "Waiting 10 seconds..."
#         Start-Sleep -Seconds 10
#     } else {
#         $num = 1000
#     }
# }

$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['text'] = "Deployment Script ended..."
