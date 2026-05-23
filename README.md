# tzirc.com

## Development

To run, run the following:

```
docker compose up -d
```

## Content

People cards are loaded from `html/json/people.json`. Each entry includes display fields, a `bot` boolean, and an `order` value for future sorting.

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
