# tzirc.com

## Development

To run, run the following:

```
docker compose up -d
```

## Content

People cards are loaded from `html/json/people.json`. Each entry includes display fields, a `bot` boolean, and an `order` value.

People render by `order` from low to high. Entries with the same `order` are shuffled on each page load, which keeps priority handles pinned while letting the middle of the nicklist move around naturally.

## Features

* Capslock Wednesday mode runs every Wednesday from 5-6pm ET. During CLW, the CLW section, header brand, and primary nav text switch to uppercase.
* CLW can be forced for testing with `?clw=1` or from the console with `clw(true)`. Use `clw(false)` to force it off.
* Double-click the large terminal logo to spin it like a top. When the spin finishes, the logo swaps between the current and original logo.
* Kick Lotto has a live hourly countdown, copyable `!klstats` command pills, and a live last-24-hours stats panel from `klstats.tzirc.com`.
* The mobile nav opens as a full-viewport blurred overlay instead of pushing the page down.
* The page includes a soft cursor-follow glow on pointer devices.

## Publish

To publish, upload to `/home/apps/containers/tzirc.com/`:

* `html/`
* `nginx.conf.template`
* `compose.prod.yml`
* `restart.sh`

As the `apps` user, run the following on the server:

```
cd /home/apps/containers/tzirc.com/
sh restart.sh
```
