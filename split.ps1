$lines = Get-Content "index.html" -Encoding UTF8
$css_lines = $lines[14..2782]
$new_index_lines = @()
$new_index_lines += $lines[0..13]
$new_index_lines += '  <link rel="stylesheet" href="style.css" />'
$new_index_lines += $lines[2783..($lines.Count - 1)]

[IO.File]::WriteAllLines((Join-Path (Get-Location) "style.css"), $css_lines, [Text.Encoding]::UTF8)
[IO.File]::WriteAllLines((Join-Path (Get-Location) "index.html"), $new_index_lines, [Text.Encoding]::UTF8)

Write-Host "Split completed successfully!"
