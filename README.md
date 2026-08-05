# tonysoprano

A lightweight, dependency-free CLI (POSIX sh + awk) that prints quotes from
*The Sopranos* — the quote, who said it, and the episode, with an original
ASCII portrait of the speaker above it.

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

`art/` holds one hand-drawn ASCII portrait per character, keyed by a slug of
the speaker name: lowercase, runs of non-alphanumerics become `-` (so
`A.J. Soprano` → `art/a-j-soprano.txt`). Speakers without a portrait get
`art/default.txt` (a generic wiseguy in a fedora). 22 characters ship with
portraits; drop a new `.txt` in `art/` to add one. All portraits are original
caricatures, not converted screenshots.

### Why the dataset is small

The show's dialogue is copyrighted, so this repo intentionally ships only a
small curated set of brief, widely-quoted lines rather than a bulk-scraped
corpus of hundreds of quotes. Extend `quotes.tsv` locally as you like.
Episode attributions are best-effort — corrections welcome.
