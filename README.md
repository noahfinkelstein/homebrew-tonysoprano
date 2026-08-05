# tonysoprano

A lightweight, dependency-free CLI (POSIX sh + awk) that prints quotes from
*The Sopranos* — always in one format: the quote, who said it, and the episode.

## Usage

```sh
./sopranos              # one random quote
./sopranos -n 3         # three random quotes
./sopranos -s paulie    # random quote from a matching speaker
./sopranos -s tony -l   # list all quotes from a matching speaker
./sopranos -l           # list everything
```

Example output:

```
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

### Why the dataset is small

The show's dialogue is copyrighted, so this repo intentionally ships only a
small curated set of brief, widely-quoted lines rather than a bulk-scraped
corpus of hundreds of quotes. Extend `quotes.tsv` locally as you like.
Episode attributions are best-effort — corrections welcome.
