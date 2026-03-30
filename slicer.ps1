$lines = Get-Content "index.html" -Encoding UTF8

$headNav = $lines[0..51]
$heroIntro = $lines[52..251]
$books = $lines[252..328]
$about = $lines[329..419]
$services = $lines[420..501]
$code = $lines[502..567]
$testi = $lines[568..756]
$gallery = $lines[757..947]
$blog = $lines[948..993]
$mediaKit = $lines[994..1118]
$contactCTA = $lines[1119..1210]
$footerEnd = $lines[1211..($lines.Count - 1)]

# index.html (Home)
# Keep Hero, Intro, Testi, some teasers, Contact, Footer.
$newIndex = @()
$newIndex += $headNav
$newIndex += $heroIntro
$newIndex += $testi
$newIndex += $contactCTA
$newIndex += $footerEnd
[IO.File]::WriteAllLines((Join-Path (Get-Location) "index.html"), $newIndex, [Text.Encoding]::UTF8)

# about.html
$aboutPage = @()
$aboutPage += $headNav
$aboutPage += $about
$aboutPage += $code
$aboutPage += $contactCTA
$aboutPage += $footerEnd
[IO.File]::WriteAllLines((Join-Path (Get-Location) "about.html"), $aboutPage, [Text.Encoding]::UTF8)

# speaking.html
$speakingPage = @()
$speakingPage += $headNav
$speakingPage += $services
$speakingPage += $mediaKit
$speakingPage += $contactCTA
$speakingPage += $footerEnd
[IO.File]::WriteAllLines((Join-Path (Get-Location) "speaking.html"), $speakingPage, [Text.Encoding]::UTF8)

# books.html
$booksPage = @()
$booksPage += $headNav
$booksPage += $books
$booksPage += $blog
$booksPage += $contactCTA
$booksPage += $footerEnd
[IO.File]::WriteAllLines((Join-Path (Get-Location) "books.html"), $booksPage, [Text.Encoding]::UTF8)

# gallery.html
$galleryPage = @()
$galleryPage += $headNav
$galleryPage += $gallery
$galleryPage += $contactCTA
$galleryPage += $footerEnd
[IO.File]::WriteAllLines((Join-Path (Get-Location) "gallery.html"), $galleryPage, [Text.Encoding]::UTF8)

Write-Host "Sliced HTML successfully!"
