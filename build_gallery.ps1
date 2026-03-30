$imgDir = "c:\Users\ADMIN\OneDrive\Desktop\Projects\public_speaker\public_speaker\Prof. Nzioki ERiK Website"
$files = Get-ChildItem -Path $imgDir -Include *.jpg,*.png,*.jpeg -Recurse

$categories = @("vip", "stage", "media", "schools", "portraits")
$catNames = @("Leaders & Dignitaries", "On Stage", "Interviews & Media", "Schools & Community", "Portraits")

$htmlSnippet = ""
$idx = 0
foreach ($f in $files) {
    $catIdx = $idx % $categories.Count
    $cat = $categories[$catIdx]
    $cname = $catNames[$catIdx]
    $relPath = "Prof. Nzioki ERiK Website/" + $f.Name
    
    $htmlSnippet += @"
        <div class="gi visible" data-cat="$cat">
          <img src="$relPath" alt="Prof Nzioki ERiK" loading="lazy" />
          <div class="gi-overlay">
            <span class="gi-cat">$cname</span>
            <p class="gi-caption">Prof. Nzioki ERiK — $cname</p>
            <span class="gi-zoom">&#8599;</span>
          </div>
        </div>
"@ + "`n"
    $idx++
}

$galleryFile = "c:\Users\ADMIN\OneDrive\Desktop\Projects\public_speaker\public_speaker\gallery.html"
$content = Get-Content $galleryFile -Raw -Encoding UTF8

$pattern = "(?s)(<div class=`"gi-grid`">).*?(</div>\s*</div>\s*</section>)"
$newContent = $content -replace $pattern, "`$1`n$htmlSnippet`n`$2"

[IO.File]::WriteAllText($galleryFile, $newContent, [Text.Encoding]::UTF8)
Write-Host "Gallery built successfully with $idx images."
