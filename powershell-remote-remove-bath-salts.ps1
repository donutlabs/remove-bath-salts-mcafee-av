$domainWorkstations = Get-ADComputer -Filter * -SearchBase "OU=Workstations,DC=domain,DC=com"

foreach ($computer in $domainWorkstations) {
    Invoke-Command -ComputerName $computer.Name -ScriptBlock {
        # Place the above script here
    }
}
