# thezone-website
<!-- <img src="html/images/logo/thezone7-cropped.png" alt="" width="48" height="48" align="top" style="margin-right: 1rem;">  -->

[![IRC: #TheZone](https://img.shields.io/badge/IRC-%23thezone%20on%20TheZoneIRC-1459b8)](https://chat.tzirc.com/)

![#TheZone IRC Network Website](html/images/thezone-website.png)


## Domains

- https://tzirc.com
- https://thezoneirc.com

### Subdomains

- https://chat.tzirc.com - controlled by an alternate project. Connects to the IRCd via websockets from the user's browser
- https://klstats.tzirc.com - controlled by the [thezone-kicklotto](https://github.com/tzirc/thezone-kicklotto) project


## TheZone TODO

* Command cheatsheet.
* Channel history timeline: Small, curated, not exhaustive. AOL add-ons, Syber/dos era, Kick Lotto logging begins in 2008, Discord bridge, modern relaunch.
* Status page section: IRC server up, webchat up, stats API up, Discord bridge up, IRC Services up. Nothing enterprise-y.


## Development

To run, run the following:

```
sh run.sh
```

Which runs: 

```
#contents of run.sh
#rm compose.yml
#mv compose.prod.yml compose.yml
docker compose down
docker compose up -d
docker logs -f thezone-website
```

Then open: 

```
https://localhost:5099/
```


## Publish

To publish, upload on `wraith` to `/home/apps/containers/thezone-website/wwwroot/`:

* `html/`
* `nginx.conf.template`
* `compose.prod.yml`
    - rename this as needed to `compose.yml`
* `run.sh`

As the `apps` user, run the following on the server:

```
cd /home/apps/containers/thezone-website/wwwroot/

# uncomment this lines below to replace compose.yml with compose.prod.yml - prior backup is deleted
#rm compose.yml.bak  
#mv compose.yml compose.yml.bak
#mv compose.prod.yml compose.yml

sh run.sh
```


## Content

### Hero Section

* The hero headline types through short words like `~/`, `Home`, `Haven`, `Shell`, `Room`, and `Signal`. Set `window.zoneHeroTyping = false` before the page script runs to disable it.
* Double-click the large terminal logo to spin it like a top. When the spin finishes, the logo swaps between the current and original logo.
* Directly under the hero area and terminal logo is a LAST 2 HRS section, displaying nicks seen by the presence system in the last 2 hours. All nicks in the channel, despite idling, are counted as present. Bots are not excluded intentionally. The browser refreshes this presence data every 10 minutes while the page is open.

### Culture

* Six cards show explaining a bit of the culture of the network or channel are present.

### Kick Lotto

* Kick Lotto has a live hourly countdown, copyable `!klstats` command pills, and a live last-24-hours stats panel from `klstats.tzirc.com` along with a pill button to see more there. The stats panel loads immediately, then refreshes at a random point 1-10 minutes after each hour.

### CLW: Caps Lock Wednesday

* Caps Lock Wednesday (CLW) mode runs every Wednesday from 5-6pm ET. It recalculates once per second, so it turns on and off automatically without a reload.
* During CLW, the CLW section, header brand, and primary nav text switch to uppercase. The CLW countdown changes to `ITS HERE!` or some version of that with a restrained red pulse.
* CLW can be forced for testing with `?clw=1` or from the console with `clw(true)`. Use `clw(false)` to force it off. Manual/query overrides win over the live schedule until the page reloads or the console function changes the override.

### People

* People cards are loaded from `html/json/people.json`. Each entry includes display fields, a `bot` boolean, and an `order` value.
* People render by `order` from low to high. Entries with the same `order` are shuffled on each page load, which keeps priority handles pinned while letting the middle of the nicklist move around naturally.

## Quotes are loaded from an API 

* The quote log section loads 30 quotes from the KLStats quote-search API, randomizes their order on each page load, and lets visitors page through them in an IRC-style transcript view.
* The quote log on the homepage is populated client-side from the KLStats API:
```text
https://klstats.tzirc.com/api/v1/quotes/quote-search
```
* `html/index.htm` requests quotes with `n=30`, `channel=thezone`, and a base64-encoded `exclude` list for filtering obvious NSFW terms. The response is expected to include a `data` array. Each quote uses `full_markup` when available, falls back to `preview_markup`, and displays the quote title plus poster/date metadata.
* The quote browser keeps the fetched rows in memory and auto-advances every 10 seconds until the visitor clicks Prev or Next. After manual interaction, the buttons continue cycling through the randomized rows without making another API request. If the API request fails or returns no rows, the section shows the local "Quote archive could not be loaded" fallback.
* API endpoints are described at https://klstats.tzirc.com on the `API Docs` tab
* Users can submit quotes for consideration by joining #TheZone, typing `!quote add`, and completing the form that is messaged to them. Quotes submitted DO need to be approved by an operator.

### Channels

* Since #TheZone is the only channel currently of note on the network, a section appears inviting others to bring their channel if they wish.

### Connect 

* The Connect section presents three paths into the room: native IRC client via an `ircs://` link, browser web chat at `chat.tzirc.com`, and the Discord bridge.

### Other Notes

* Social sharing metadata uses `html/images/og-thezone.png`, with `html/images/og-thezone.svg` kept as an editable source concept.
* The mobile nav opens as a full-viewport blurred overlay instead of pushing the page down.
* The page includes a soft cursor-follow glow on pointer devices.
* On low-performance devices, animations are automatically suppressed. The script adds `js-reduce-motion` to `<html>` using two checks: an immediate heuristic (≤2 hardware threads, e.g. Core 2 Duo) and an async 15-frame RAF benchmark that fires if average frame time exceeds 25ms (~40fps). When active, it disables the marquee, CLW countdown pulse, logo spin, hero typing, and cursor glow — the same set as `prefers-reduced-motion`.
