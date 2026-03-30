$files = Get-ChildItem -Filter "*.html"
foreach ($f in $files) {
    if ($f.Name -ne "audit.html") {
        $content = Get-Content $f.FullName -Raw -Encoding UTF8
        if ($content -notmatch "premium-ux.js") {
            $content = $content -replace '(?i)</body>', "  <script src=`"premium-ux.js`"></script>`n</body>"
            [IO.File]::WriteAllText($f.FullName, $content, [Text.Encoding]::UTF8)
        }
    }
}

$cssBlob = @"

/* Shimmering Skeleton Loader for Gallery */
.gi {
    background: linear-gradient(90deg, var(--ink) 25%, #18181a 50%, var(--ink) 75%);
    background-size: 200% 100%;
    animation: shimmer 1.5s infinite linear;
}
@keyframes shimmer {
    0% { background-position: -200% 0; }
    100% { background-position: 200% 0; }
}
"@
Add-Content -Path "style.css" -Value $cssBlob

Write-Host "Injected Ultimate UX components successfully!"
