FROM oberd/php-8.0-apache

This image includes the mysqli and sockets extension as well as having the option of getting the image with or without `ssl-certs` and `a2enmod ssl`

I've also made it so that there a clear entrypoint:

`/usr/local/bin/run_entrypoints.sh`

Which will run all the shell scripts in:

`/startup_scripts`

This will make it so that you can easily add startup tasks by just adding the following line to your `Dockerfile`:
`COPY /PATH/TO/YOUR/STARTUP/SCRIPTS /startup_scripts`

Making sure to set the entrypoint to `run_entrypoints.sh`:

`CMD ["/usr/local/bin/run_entrypoints.sh"]`