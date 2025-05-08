param (
    [string]$directoryPath,
    [string]$token,
    [string]$replacement
)

# Get all files in the specified directory
Write-Output "Replacing tokens in files in directory: $directoryPath"
$files = Get-ChildItem -Path $directoryPath -Recurse -File

foreach ($file in $files) {
    # Read the content of the file
    $fileName = $file.FullName
    Write-Output "Processing file: $fileName"
    $content = Get-Content -Path $file.FullName

    # Replace the token with the replacement value
    Write-Output "Replacing token: $token to Replacement: $replacement"
    $content | Select-String -Pattern $token -CaseSensitive -SimpleMatch
    $updatedContent = $content -replace $token, $replacement
    # Write the updated content back to the file
    Set-Content -Path $file.FullName -Value $updatedContent
    Write-Output "Token replaced in file: $fileName"
    $updatedContent | Select-String -Pattern $replacement -CaseSensitive -SimpleMatch
}

Write-Output "Token replacement completed."