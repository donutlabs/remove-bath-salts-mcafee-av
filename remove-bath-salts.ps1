# Step 1: Identify Installed McAfee Products
$mcAfeeProducts = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -match "McAfee" }

# Step 2: Uninstall McAfee Products
foreach ($product in $mcAfeeProducts) {
    $productCode = $product.IdentifyingNumber
    Write-Host "Uninstalling $($product.Name)..."
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/x $productCode /qn" -Wait
    Write-Host "$($product.Name) uninstalled."
}

# Step 3: Remove Hidden DLL Files
$mcAfeeDirectories = @(
    "C:\Program Files\McAfee",
    "C:\Program Files (x86)\McAfee",
    "C:\ProgramData\McAfee"
)

foreach ($directory in $mcAfeeDirectories) {
    if (Test-Path $directory) {
        Get-ChildItem -Path $directory -Include *.dll -Recurse -Force | ForEach-Object {
            try {
                Remove-Item -Path $_.FullName -Force
                Write-Host "Removed hidden DLL: $($_.FullName)"
            } catch {
                Write-Host "Failed to remove: $($_.FullName) - $_"
            }
        }
    }
}
