$files = Get-ChildItem -Filter "*.html"
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    
    # Replace links
    $content = $content -replace 'href="#about"', 'href="about.html"'
    $content = $content -replace 'href="#services"', 'href="speaking.html"'
    $content = $content -replace 'href="#books"', 'href="books.html"'
    $content = $content -replace 'href="#code"', 'href="about.html#code"'
    $content = $content -replace 'href="#gallery"', 'href="gallery.html"'
    $content = $content -replace 'href="#testi"', 'href="index.html#testi"'
    $content = $content -replace 'href="#blog"', 'href="books.html#blog"'
    $content = $content -replace 'href="#mk"', 'href="speaking.html#mk"'
    $content = $content -replace 'href="#hero"', 'href="index.html"'

    # Note: `#contact` and `#cta-band` remain local since they were copied to all pages.

    [IO.File]::WriteAllText($f.FullName, $content, [Text.Encoding]::UTF8)
}
Write-Host "Links updated successfully!"
