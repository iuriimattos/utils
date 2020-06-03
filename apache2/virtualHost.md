# making virtual host

```
/etc/apache2/sites-available
```

```
touch [sitename].host.conf
```

```
edit [sitename].host.conf
```

```
2ensite [sitename].host.conf
```

```
edit /etc/hosts
```

```
disable default host conf (sudo a2dissite 000-default.conf)
```

```
a2dissite [sitename].host.conf
```

```
sudo systemctl restart apache2
```

```
sudo service apache2 restart

``````
a2enmod rewrite
```
