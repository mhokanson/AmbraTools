function New-AmbraSession {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]	$baseUrl,
		[Parameter(Mandatory)][pscredential]  $credential
	)
 # https://stackoverflow.com/a/28353003/2402812
	$SecurePassword = $credential.Password
	$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
	$UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

	$rest_body = @{
		login    = $credential.UserName
		password = $UnsecurePassword
	}

	$rest_endpoint = "$baseUrl/session/login"

	Write-Verbose "Endpoint: $rest_endpoint"
	Write-Verbose "payload: $(Convert-HashToString -Hash $rest_body)"
	$reply = Invoke-RestMethod -Method Post -Uri $rest_endpoint -Body $rest_body

	return $reply
}