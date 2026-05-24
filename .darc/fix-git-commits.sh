git config user.name "Darc"
git config user.email "darc@darcfx.com"
git config --local --list | grep '^user\.'


# rewrite commits
git filter-repo --name-callback 'return b"Darc"' --email-callback 'return b"darc@darcfx.com"'

git remote add origin ssh://git@gitea-ssh.home.jaybaldwin.com:30009/thezone/thezone-website.git
git push --force --all origin 
git push --force --tags origin