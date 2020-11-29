<?php

define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'root' );

define( 'DB_PASSWORD', '' );

define( 'DB_HOST', 'localhost' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

	define('AUTH_KEY',         '3FwnqSD*qHT?d2C|8?1KB|R(1t61hY&b>6k$O:nRc#ys7S131Ke!$1N({Aa#Wbjv');
	define('SECURE_AUTH_KEY',  '*db.i@&j)2<cFo*([{rYNZNR+rwih1w)MK8Y_C-FzJ_NAA=RJ,mL{v^ 8epD_,vm');
	define('LOGGED_IN_KEY',    'yE7S oDs-D<*CS}G+ZX*p1-]Mk F[w|OE|Pn`#5o^CU&?Eul=*8g/.,Pg[T2+#Fg');
	define('NONCE_KEY',        'a/Y$03N9)<#qSD_z=:OcQ`*$%=&e2id!tg).Gh5<^d~P8;|`N+riu4=]r$=<| T*');
	define('AUTH_SALT',        'vV7Q^Fg;B}{wcJ$!8la.a}JY<_&k,&Z&-y[h+P+L&v>#EkO>gF1AwE#a^W9}+rZR');
	define('SECURE_AUTH_SALT', 'E>URA=J*]j5C:Mg%-4eyeB#6,YhrB_/xW?}irc-[y+rBO14h|~i+E.g9l }!7|e+');
	define('LOGGED_IN_SALT',   '|J#7O(%c^(CXu9J1|(u+=Ln7/.HJg)vUSGtmnq!;+hT5X#WtK~5hy1d9)mNz8gGV');
	define('NONCE_SALT',       'H3}Q]NQl-T9U9--^I2=^(p=2$+DLWNLk}TLjt0*cM5ALSC2]Ea~|,uNk!G|K9t[[');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';