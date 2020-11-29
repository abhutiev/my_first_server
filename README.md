# my_first_server
Server installing. This server running phpMyAdmin, WordPress and SQL database.

For illustration, I broke every process into many parts. In practical terms, it would be useful to create as few layers as possible.

How to work with this:
For building from Dockerfile:		docker build -t server .
For running:						docker run -it -p 80:80 -p 443:443
For turning-off:					exit

SCREENSHOTS ATTACHED.
