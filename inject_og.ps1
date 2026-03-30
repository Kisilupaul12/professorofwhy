$files = Get-ChildItem -Filter "*.html"
$ogTags = @"
  <meta property="og:title" content="Prof. Nzioki ERiK — The Professor of Why™" />
  <meta property="og:description" content="Keynote speaker, published author of 3 books, and leadership strategist. Endorsed by Kenya's VP and Africa's top leaders." />
  <meta property="og:image" content="Prof. Nzioki ERiK Website/IMG-20260224-WA0006.jpg" />
  <meta property="og:url" content="https://professorofwhy.com" />
  <meta name="twitter:card" content="summary_large_image" />
"@

foreach ($f in $files) {
    if ($f.Name -ne "audit.html") {
        $content = Get-Content $f.FullName -Raw -Encoding UTF8
        # Ensure we don't duplicate
        if ($content -notmatch "og:title") {
            $content = $content -replace '(?i)</head>', "$ogTags`n</head>"
            [IO.File]::WriteAllText($f.FullName, $content, [Text.Encoding]::UTF8)
        }
    }
}
Write-Host "Injected OG tags successfully!"
