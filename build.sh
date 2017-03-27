set -e

outDir="build"
rm -rf $outDir
mkdir -p $outDir

entryPoints=(
    "src/tv-browser.html"
    "src/exercise-editor/tve-renderer.html"
    "src/exercise-editor/tv-exercise-editor.html"
    "src/tekvideo-exercise-card.html"
)

function build {
    printf "Processing file: '%s'\n" "$1"
    dir=$(dirname "$outDir/$1")
    mkdir -p $dir
    vulcanize $1 --strip-comments --inline-scripts --inline-css > $outDir/$1
}

for item in "${entryPoints[@]}"
do
    build $item
done

