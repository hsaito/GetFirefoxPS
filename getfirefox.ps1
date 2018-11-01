[CmdletBinding()]
param (
    [parameter(Position = 0, Mandatory = $true, ParameterSetName = "Release", HelpMessage = "Directory to download to")]
    [parameter(Position = 0, Mandatory = $true, ParameterSetName = "Candidate", HelpMessage = "Directory to download to")]
    [string]
    $FirefoxPath,
    
    [parameter(Position = 1, Mandatory = $true, ParameterSetName = "Release", HelpMessage = "Version to download")]
    [parameter(Position = 1, Mandatory = $true, ParameterSetName = "Candidate", HelpMessage = "Version to download")]
    [string]
    $Version,
    
    [parameter(ParameterSetName = "Candidate", HelpMessage = "Download release candidate (RC)")]
    [switch]
    $ReleaseCandidate,

    [parameter(Mandatory = $true, ParameterSetName = "Candidate", HelpMessage = "Build number")]
    [int]
    $BuildNumber,

    [parameter(HelpMessage = "Language (default: en-US)")]
    [string]
    $Language = "en-US"
)

$processedPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($FirefoxPath)

$firefoxFile = "firefox-$Version.tar.bz2"
$url = ""

if (!$ReleaseCandidate) {
    Write-Verbose "Downloading Firefox $Version to $processedPath"
    $url = "https://ftp.mozilla.org/pub/firefox/releases/$Version/linux-x86_64/$Language/$firefoxFile"
}
else {
    Write-Verbose "Downloading Firefox $Version RC $BuildNumber to $processedPath"
    $url = "https://ftp.mozilla.org/pub/firefox/candidates/$Version-candidates/build$BuildNumber/linux-x86_64/$Language/$firefoxFile"
}

Write-Verbose "URL is $url"
    
$client = New-Object System.Net.WebClient
$client.DownloadFile("$url", "/tmp/$firefoxFile")

Remove-Item -Recurse $processedPath -ErrorAction SilentlyContinue
New-Item -ItemType directory -Path $processedPath -ErrorAction Stop
Set-Location $processedPath/..

tar xvjf "/tmp/$firefoxFile"