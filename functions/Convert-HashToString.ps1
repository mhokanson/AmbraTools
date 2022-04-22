# source: https://www.sapien.com/blog/2014/10/21/a-better-tostring-method-for-hash-tables/
function Convert-HashToString {
	param
	(
		[Parameter(Mandatory = $true)]
		[System.Collections.Hashtable]
		$Hash
	)
	$hashstr = "@{"
	$keys = $Hash.keys
	foreach ($key in $keys) {
		$v = $Hash[$key]
		if ($key -match "\s") {
			$hashstr += "`"$key`"" + "=" + "`"$v`"" + ";"
		}
		else {
			$hashstr += $key + "=" + "`"$v`"" + ";"
		}
	}
	$hashstr += "}"
	return $hashstr
}