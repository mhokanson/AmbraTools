function Push-AmbraStudy {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]	$baseUrl,
		[Parameter(Mandatory)]	$session_id,
		[Parameter(Mandatory)]	$study_uuid,
		[Parameter(Mandatory)]	$destination_id
	)


	$rest_body = @{
		sid					= $session_id
		account_id			= $account_id
		study_uuid			= $study_uuid
		destination_uuid 	= $destination_id
	}

	$rest_endpoint = "$baseUrl/study/push"
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