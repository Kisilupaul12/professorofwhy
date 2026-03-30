$styleFile = "style.css"
$css = Get-Content $styleFile -Raw -Encoding UTF8
$css = $css -replace '(?i)<style.*?>', ''
$css = $css -replace '(?i)</style>', ''
[IO.File]::WriteAllText($styleFile, $css, [Text.Encoding]::UTF8)

$htmlFiles = Get-ChildItem -Filter "*.html"
foreach ($f in $htmlFiles) {
    $html = Get-Content $f.FullName -Raw -Encoding UTF8
    $html = $html -replace '(?i)</style>', ''
    [IO.File]::WriteAllText($f.FullName, $html, [Text.Encoding]::UTF8)
}

Write-Host "Fixed styles successfully!"
