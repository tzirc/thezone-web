#rm compose.yml
#mv compose.prod.yml compose.yml
docker compose down
docker compose up -d
docker logs -f thezone-website