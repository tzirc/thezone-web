# tzirc.com

## Development

To run, run the following:

```
docker compose up -d
```

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

