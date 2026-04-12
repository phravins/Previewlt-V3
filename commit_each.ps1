git init
git add .gitignore -f
git commit -m "Initialize repository and base gitignore"

# Ensure we use an initial branch name that works commonly
git branch -M main
git remote remove origin 2>$null
git remote add origin "https://github.com/phravins/Previewlt-V3.git"

# Get all tracked but modified files, and all untracked files that aren't ignored
$files = $(git ls-files --others --modified --exclude-standard)

foreach ($f in $files) {
    if (-not [string]::IsNullOrWhiteSpace($f)) {
        Write-Host "Committing $f..."
        git add "$f"
        git commit -m "Add $f"
    }
}

Write-Host "Finished individual commits."
git push -u origin main --force
