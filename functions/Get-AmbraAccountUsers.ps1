function Get-AmbraAccountUsers {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]	$baseUrl,
		[Parameter(Mandatory)]	$session_id,
		[Parameter(Mandatory)]	$account_id
	)

	$rest_body = @{
		sid  = $session_id
		uuid = $account_id
	}

	$rest_endpoint = "$baseUrl/account/user/list"

	Write-Verbose "Endpoint: $rest_endpoint"
	Write-Verbose "payload: $(Convert-HashToString -Hash $rest_body)"
	$reply = Invoke-RestMethod -Method Post -Uri $rest_endpoint -Body $rest_body

	return $reply
}