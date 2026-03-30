function Update-Title($file, $newTitle) {
    $content = Get-Content $file -Raw -Encoding UTF8
    $pattern = "(?i)<title>.*?</title>"
    $newContent = $content -replace $pattern, "<title>$newTitle</title>"
    [IO.File]::WriteAllText($file, $newContent, [Text.Encoding]::UTF8)
}

Update-Title "about.html" "About | Prof. Nzioki ERiK — The Professor of Why™"
Update-Title "speaking.html" "Speaking & Services | Prof. Nzioki ERiK — The Professor of Why™"
Update-Title "gallery.html" "Gallery | Prof. Nzioki ERiK — The Professor of Why™"
Update-Title "books.html" "Books & Publications | Prof. Nzioki ERiK — The Professor of Why™"
Update-Title "index.html" "Home | Prof. Nzioki ERiK — The Professor of Why™"

Write-Host "Titles updated successfully for SEO!"
