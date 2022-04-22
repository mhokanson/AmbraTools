$script:ModuleRoot = $PSScriptRoot

function Import-ModuleFile
{
	[CmdletBinding()]
	Param (
		[string]
		$Path
	)
	
	if ($doDotSource) { . $Path }
	else { $ExecutionContext.InvokeCommand.InvokeScript($false, ([scriptblock]::Create([io.file]::ReadAllText($Path))), $null, $null) }
}


# Execute Preimport actions
#. Import-ModuleFile -Path "$ModuleRoot\internal\scripts\preimport.ps1"

# Import all internal functions
#foreach ($function in (Get-ChildItem "$ModuleRoot\internal\functions\*\*.ps1" -ErrorAction SilentlyContinue))
#{
#	. Import-ModuleFile -Path $function.FullName
#}

# Import non-powershell components
Add-Type -AssemblyName System.Web

# Import all public functions
foreach ($function in (Get-ChildItem "$ModuleRoot\functions\*.ps1"))
{
	. Import-ModuleFile -Path $function.FullName
}

# Execute Postimport actions
#. Import-ModuleFile -Path "$ModuleRoot\internal\scripts\postimport.ps1"
# $ambraConfig = Get-AmbraConfig -Path "$ModuleRoot\config\settings.cfg"