
While switching betweend `prod` and `dev` environment, command `./bin/console cache:clear` is run usually as a different user than the `www-data` or any other user running the webserver. This cause the `var/cache/` folder to be created with wrong permissions. The front/backend looks broken, the website gets constant `permission denied` errors while trying to access the cache folder.

The commands (script) below fixes the problem.

```
# sudo apt install acl
# HTTPDUSER=$(ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1)
# sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var
# sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var
```
