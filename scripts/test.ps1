param([string] $name)

$output = 'Hello {0}. The Source is {1}, the Target is {2}, the SASToken is {3}.' -f $name, ${Env:Source}, ${Env:Target}, ${Env:SASToken}
Write-Output $output

Invoke-WebRequest -Uri https://mceus2sa.blob.core.windows.net/tools/linux/azcopy -OutFile azcopy -UseBasicParsing
chmod 755 azcopy

Write-Output "./azcopy copy \"${Env:Source}\" \"${Env:Target}?${Env:SASToken}\" --from-to=BlobBlob --blob-type=PageBlob'
./azcopy copy "${Env:Source}" "${Env:Target}?${Env:SASToken}" --from-to=BlobBlob --blob-type=PageBlob

for ($num = 1; $num -le 1000; $num++) {
    $sc = (Invoke-WebRequest -Uri "${Env:Target}?${Env:SASToken}" -Method Head -SkipHttpErrorCheck).StatusCode
    Write-Output $sc
    if ($sc -ne 200) {
		Start-Sleep -Seconds 10
	} else {
		$num= 1000
	}
}

$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['text'] = $output
