$html = Get-Content "gallery.html" -Raw -Encoding UTF8
$html = $html -replace 'Prof\. Nzioki ERiK Website/', 'media/gallery/'
[IO.File]::WriteAllText("gallery.html", $html, [Text.Encoding]::UTF8)

# Create the correct directory structure
New-Item -ItemType Directory -Force -Path "media/gallery"
Write-Host "Updated gallery.html to use safe media/gallery paths and created directories."
