# Trusty-HHVM (LTS)

### Abstract
Provides HHVM running on top of Ubuntu Trusty, with an nginx web server.

### Paths
Place your application (or application volume) at `/var/www/app` with public document root at `/var/www/app/public`.  If your application uses sessions, mount `/var/lib/hhvm/sessions` as an external volume.

### Default User
HHVM and nginx are configured to drop privileges to the `www-data` user.

### Exposed Port
Nginx is exposed on port 80

### Laravel Example
```dockerfile
FROM yetisupport/trusty-hhvm:3.9

# Add our application
ADD . /var/www/app

# Mount Laravel's logs to an external volume so we can clean them up
VOLUME /var/www/app/storage/logs

# We use a custom upload path
VOLUME /var/www/app/storage/uploads

# Chown our uploads directory so HHVM can write to it
RUN chown -R www-data /var/www/app/storage/uploads
```
