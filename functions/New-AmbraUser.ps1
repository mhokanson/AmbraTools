function New-AmbraUser {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]	$baseUrl,
		[Parameter(Mandatory)]	$session_id,
		[Parameter(Mandatory)]	$account_id,
		[Parameter(Mandatory)]	$email,
		[Parameter(Mandatory)]	$first_name,
		[Parameter(Mandatory)]	$last_name,
		[Parameter(Mandatory)]	$initial_pwd
	)


	$rest_body = @{
		sid        = $session_id
		account_id = $account_id
		first      = $first_name
		last       = $last_name
		password   = $initial_pwd
		email      = $email
	}

	$rest_endpoint = "$baseUrl/user/add"
	Write-Verbose "Endpoint: $rest_endpoint"
	Write-Verbose "payload: $(Convert-HashToString -Hash $rest_body)"
	try {
		$reply = Invoke-RestMethod -Method Post -Uri $rest_endpoint -Body $rest_body
	}
 catch {
		$reply = $_.Exception.Response
	}

	return $reply
}