# -*- text -*-
##
## admin.sql -- MySQL commands for creating the RADIUS user.
##
##	WARNING: You should change 'localhost' and 'radpass'
##		 to something else.  Also update raddb/sql.conf
##		 with the new RADIUS password.
##
##	$Id: fe85156a2f14ddf6be764f45ee9e4edcd2843020 $

#
#  Create default administrator for RADIUS
#
CREATE USER 'radius'@'localhost';
SET PASSWORD FOR 'radius'@'localhost' = PASSWORD('radpass');

# The server can read any table in SQL
GRANT ALL ON radius.* TO 'radius'@'localhost' identified by 'radpass';
GRANT ALL ON radius.* TO 'radius'@'radsrvr' identified by 'radpass';

# The server can write to the accounting and post-auth logging table.
#
#  i.e. 
#GRANT ALL on radius.radacct TO 'radius'@'localhost' identified by 'radpass';
#GRANT ALL on radius.radacct TO 'radius'@'radsrvr' identified by 'radpass';
