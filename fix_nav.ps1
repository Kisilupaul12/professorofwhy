$files = Get-ChildItem -Filter "*.html"
$pattern = '(?i)<li><a href="about\.html">About</a></li>'
$replacement = "<li><a href=`"index.html`">Home</a></li>`n          <li><a href=`"about.html`">About</a></li>"

foreach ($f in $files) {
    if ($f.Name -ne "audit.html") {
        $content = Get-Content $f.FullName -Raw -Encoding UTF8
        # Ensure we don't accidentally add it twice
        if ($content -notmatch '<li><a href="index\.html">Home</a></li>\s*<li><a href="about\.html">About</a></li>') {
            $content = $content -replace $pattern, $replacement
            [IO.File]::WriteAllText($f.FullName, $content, [Text.Encoding]::UTF8)
        }
    }
}
Write-Host "Home link added to navigation menus globally!"
