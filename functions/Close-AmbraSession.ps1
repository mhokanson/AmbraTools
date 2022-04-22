function Close-AmbraSession {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]	$baseUrl,
		[Parameter()]	$session_id
	)

	$rest_body = @{
		sid = $session_id
	}

	$rest_endpoint = "$baseUrl/session/logout"

	Write-Verbose "Endpoint: $rest_endpoint"
	Write-Verbose "payload: $(Convert-HashToString -Hash $rest_body)"
	if ($session_id -ne "" -and
		$null -ne $session_id) {
		$reply = Invoke-RestMethod -Method Post -Uri $rest_endpoint -Body $rest_body
	}
	else {
		$reply = Invoke-RestMethod -Method Post -Uri $rest_endpoint
	}

	return $reply
}