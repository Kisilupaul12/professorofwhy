$files = Get-ChildItem -Filter "*.html"
$scriptTags = @"
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
  <script src="animations.js"></script>
</body>
"@

foreach ($f in $files) {
    if ($f.Name -ne "audit.html") {
        $content = Get-Content $f.FullName -Raw -Encoding UTF8
        if ($content -notmatch "animations.js") {
            $content = $content -replace '(?i)</body>', "$scriptTags"
            [IO.File]::WriteAllText($f.FullName, $content, [Text.Encoding]::UTF8)
        }
    }
}
Write-Host "Injected GSAP logic successfully!"
