# tzirc.com


## TheZone TODO

* Command cheatsheet.
* Channel history timeline: Small, curated, not exhaustive. AOL add-ons, Syber/dos era, Kick Lotto logging begins in 2008, Discord bridge, modern relaunch.
* Status page section: IRC server up, webchat up, stats API up, Discord bridge up, IRC Services up. Nothing enterprise-y.


## Development

To run, run the following:

```
docker compose up -d
```

Open: 

```
https://localhost:5099/
```

## Content

People cards are loaded from `html/json/people.json`. Each entry includes display fields, a `bot` boolean, and an `order` value.

People render by `order` from low to high. Entries with the same `order` are shuffled on each page load, which keeps priority handles pinned while letting the middle of the nicklist move around naturally.

## Features

* Capslock Wednesday mode runs every Wednesday from 5-6pm ET. It recalculates once per second, so it turns on and off automatically without a reload.
* During CLW, the CLW section, header brand, and primary nav text switch to uppercase. The CLW countdown changes to `ITS HERE!` with a restrained red pulse.
* CLW can be forced for testing with `?clw=1` or from the console with `clw(true)`. Use `clw(false)` to force it off. Manual/query overrides win over the live schedule until the page reloads or the console function changes the override.
* The hero headline types through short words like `~/`, `Home`, `Haven`, `Shell`, `Room`, and `Signal`. Set `window.zoneHeroTyping = false` before the page script runs to disable it.
* Double-click the large terminal logo to spin it like a top. When the spin finishes, the logo swaps between the current and original logo.
* Kick Lotto has a live hourly countdown, copyable `!klstats` command pills, and a live last-24-hours stats panel from `klstats.tzirc.com`.
* The quote log section loads six quotes from the KLStats quote-search API and lets visitors page through them in an IRC-style transcript view.
* The Connect section presents three paths into the room: native IRC client, browser web chat at `chat.tzirc.com`, and the Discord bridge.
* Social sharing metadata uses `html/images/og-thezone.png`, with `html/images/og-thezone.svg` kept as an editable source concept.
* The mobile nav opens as a full-viewport blurred overlay instead of pushing the page down.
* The page includes a soft cursor-follow glow on pointer devices.

## Publish

To publish, upload on `wraith` to `/home/apps/containers/thezone-website/wwwroot/`:

* `html/`
* `nginx.conf.template`
* `compose.prod.yml`
* `restart.sh`

As the `apps` user, run the following on the server:

```
cd /home/apps/containers/thezone-website/wwwroot/
sh restart.sh
```
