function Add-AmbraUserToAccount {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]	$baseUrl,
		[Parameter(Mandatory)]	$session_id,
		[Parameter(Mandatory)]	$account_id,
		[Parameter(Mandatory)]	$email,
		[Parameter(Mandatory)]	$role_id
	)

	$rest_body = @{
		sid    = $session_id
		uuid   = $account_id
		email  = $email
		global = 1
		role_id = $role_id
	}

	$rest_endpoint = "$baseUrl/account/user/add"
	Write-Verbose "Endpoint: $rest_endpoint"
	Write-Verbose "payload: $(Convert-HashToString -Hash $rest_body)"
	try {
		$reply = Invoke-RestMethod -Method Post -Uri $rest_endpoint -Body $rest_body -OutVariable $reply
	}
 catch {
		$reply = $_.Exception.Response
	}

	return $reply
}