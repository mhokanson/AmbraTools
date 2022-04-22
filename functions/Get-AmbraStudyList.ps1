function Get-AmbraStudyList {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory)]	$baseUrl,
		[Parameter(Mandatory)]	$session_id,
								$filters
	)

	$filters.Add("sid",$session_id)

	$rest_endpoint = "$baseUrl/study/list"
	Write-Verbose "Endpoint: $rest_endpoint"
#	Write-Verbose "payload: $(Convert-HashToString -Hash $rest_body)"
	try {
		$reply = Invoke-RestMethod -Method Post -Uri $rest_endpoint -Body $filters -OutVariable $reply
	}
 catch {
		$reply = $_.Exception.Response
	}

	return $reply
}