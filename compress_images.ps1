$ErrorAction = "Stop"

if (!(Test-Path "$PSScriptRoot/compressed")) {
    New-Item -ItemType Directory compressed
}

Get-ChildItem "$PSScriptRoot/*.png" | % {
    $filename = $_.name
    ffmpeg -i $filename -compression_level 100 "$PSScriptRoot/compressed/$filename" -y
}