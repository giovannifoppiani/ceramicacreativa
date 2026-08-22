#!/bin/zsh
cd "$(dirname "$0")"

echo "Checking for changes..."
git add index.html img .gitignore

if git diff --cached --quiet; then
  echo "Nothing to publish — no changes since the last update."
else
  git commit -m "Update site — $(date '+%Y-%m-%d %H:%M')"
  git push origin main
  echo ""
  echo "Published. If GitHub Pages is enabled, the live site updates in ~1 minute."
fi

echo ""
echo "Press any key to close this window..."
read -k 1
