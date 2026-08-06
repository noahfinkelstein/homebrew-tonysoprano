# The Sopranos CLI, whatever happened there...

Commendatori! This is a lightweight, dependency-free command-line interface (utilizing POSIX sh + awk) that prints iconic quotes from HBO's hit series "The Sopranos." 
It features character ASCII portraits, smart terminal scaling, and flexible filtering. Feedback and corrections are more than welcome.

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ffd14100-0c21-4742-a19b-68081a38cabf" />

## Install

**Homebrew** (this repo doubles as a tap):

```sh
brew tap noahfinkelstein/sopranos
brew install tonysoprano
```

After the one-time tap, the short name is enough (`tonysoprano` is a tap
alias for the `sopranos` formula — either name works). Add `--HEAD` to
install from `main` instead of the latest release.

## Usage

```sh
sopranos                    # one random quote (with portrait)
sopranos -n 3               # three random quotes
sopranos -s paulie          # random quote from a matching speaker
sopranos -e "pine barrens"  # random quote from a matching episode
sopranos -s tony -l         # list all matches
sopranos -q                 # quote only, no portrait
sopranos -i                 # invert shading (light-background terminals)
sopranos -V                 # version
```

Portraits auto-scale to fit the terminal — in a small window the art is
downsampled to leave room for the quote; `-q` skips it entirely.

Output format:

```
<portrait>
"'Remember when' is the lowest form of conversation."
  — Tony Soprano, Remember When (S06E15)
```

## Data

`quotes.tsv` holds 1000 quotes

```
quote<TAB>speaker<TAB>episode
```

Add lines and the CLI picks them up immediately — no build step. To
re-import from a spreadsheet (columns: Quote, Speaker, Episode Title,
Ep. Code):

```sh
tools/import-xlsx quotes.xlsx > quotes.tsv
```

## Portraits

`art/` holds one ASCII portrait per character, keyed by a slug of the
speaker name: lowercase, runs of non-alphanumerics become `-` (so
`A.J. Soprano` → `art/a-j-soprano.txt`). Speakers without a portrait get
`art/default.txt`. Drop a new `.txt` in `art/` to add or replace one.

Photo portraits are stored as pixel grids (digits 0-4, Floyd-Steinberg
dithered) that the CLI renders as shaded block characters (`░▒▓█`), two
columns per pixel, scaled to your terminal. Hand-drawn `.txt` art still
works — any file that isn't a digit grid prints literally.

To regenerate portraits from freely-licensed cast photos on Wikimedia
Commons (licenses and authors recorded in `art/CREDITS.txt`):

```sh
tools/get-cast-photos      # downloads cast-photos/<slug>.jpg + credits
tools/img2ascii cast-photos/   # converts them all into art/
```

To use your own image for any character:

```sh
tools/img2ascii tony.png -o art/tony-soprano.txt
```

`img2ascii` needs Python 3 + Pillow; `get-cast-photos` is stdlib-only and
`import-xlsx` needs openpyxl. Shading assumes a dark terminal — use the
CLI's `-i` flag on light backgrounds.

Sources & Credits 
<br>
<br> Quotes: Hand-curated brief attributed lines. Episode attributions are best-effort.
<br> Portraits: Derived from freely licensed Wikimedia Commons photographs (see art/CREDITS.txt) or original caricatures.
Anyway, $4 a pound.
