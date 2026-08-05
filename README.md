# tonysoprano

A lightweight, dependency-free CLI (POSIX sh + awk) that prints quotes from
*The Sopranos* — the quote, who said it, and the episode, with an original
ASCII portrait of the speaker above it.

## Install

**Homebrew** (this repo doubles as a tap):

```sh
brew tap noahfinkelstein/tonysoprano https://github.com/noahfinkelstein/tonysoprano
brew install tonysoprano
```

After the one-time tap, the short name is enough (`tonysoprano` is a tap
alias for the `sopranos` formula — either name works). Add `--HEAD` to
install from `main` instead of the latest release.

**Make** (symlinks the checkout onto your PATH):

```sh
make install            # PREFIX=/usr/local by default
make install PREFIX=~/.local
```

Either way, `sopranos` resolves its own symlink to find `quotes.tsv` and
`art/`, so editing the data in place keeps working after install.

## Usage

```sh
./sopranos              # one random quote (with portrait)
./sopranos -n 3         # three random quotes
./sopranos -s paulie    # random quote from a matching speaker
./sopranos -s tony -l   # list all quotes from a matching speaker
./sopranos -l           # list everything
./sopranos -q           # quote only, no portrait
```

Example output:

```
    .-----.
   /       \
  ||_     _||
  |  o   o  |
  |    L    |
  |  ,---o==~
   \       /
    '-----'
"'Remember when' is the lowest form of conversation."
  — Tony Soprano, Remember When (S6E15)
```

Optionally symlink it onto your PATH:

```sh
ln -s "$(pwd)/sopranos" /usr/local/bin/sopranos
```

## Data

Quotes live in `quotes.tsv`, one per line, three tab-separated fields:

```
quote<TAB>speaker<TAB>episode
```

Add lines to `quotes.tsv` and the CLI picks them up immediately — no build step.

## Portraits

`art/` holds one shaded ASCII portrait per character, keyed by a slug of
the speaker name: lowercase, runs of non-alphanumerics become `-` (so
`A.J. Soprano` → `art/a-j-soprano.txt`). Speakers without a portrait get
`art/default.txt` (a generic wiseguy in a fedora). 22 characters ship with
portraits; drop a new `.txt` in `art/` to add or replace one. The shipped
portraits are original hand-drawn caricatures, not converted screenshots.

## Photorealistic portraits

For true photorealism, convert your own images (e.g. screenshots you've
taken from your copy of the show) with the bundled converter and write the
result over the matching art file:

```sh
tools/img2ascii tony.png -w 60 -o art/tony-soprano.txt
```

`img2ascii` needs Python 3 + Pillow. It maps pixel brightness onto a
10-step glyph ramp with autocontrast; `-w` sets output width in characters,
`--aspect` compensates for terminal cell height (default 0.5), and
`--invert` flips the ramp for light-background terminals or viewers.
The CLI picks up whatever is in `art/` — no other wiring needed.

To convert a whole folder at once, name each image after its speaker slug
and run the batch tool:

```sh
tools/make-portraits portraits/ 60   # portraits/tony-soprano.jpg -> art/tony-soprano.txt
```

### Why the dataset is small

The show's dialogue is copyrighted, so this repo intentionally ships only a
small curated set of brief, widely-quoted lines rather than a bulk-scraped
corpus of hundreds of quotes. Extend `quotes.tsv` locally as you like.
Episode attributions are best-effort — corrections welcome.
