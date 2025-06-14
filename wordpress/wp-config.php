<?php
/**
 * The base configuration for WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress' );

/** Database hostname */
define( 'DB_HOST', 'mysql' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 */
define('AUTH_KEY',         'k[NgP1i.gz[s/90v(ePh9hH6<,Ky$HRqck7|&SeFmv_^uYbK{w`%s;&,{D|Q`A++');
define('SECURE_AUTH_KEY',  'Ds^@7XSqYA5u]3V7B&eV}no7)g?+qAhiTZ<z^>o+0&`s07-p-$eN|NX#z&8pb4Ck');
define('LOGGED_IN_KEY',    'Rm$)F|LCGH&Ac=XPAS,&m!j(ww2v?2Y]| =)|(g$LG|5R9qGBJOa#e5Ygp)`W9+Q');
define('NONCE_KEY',        '.of#,_@c3?U.}-[}Xer2a-vHT*RYxrDZ&s!nyzKMfmvk?pj}ccj=a$H/CJ[>f>(G');
define('AUTH_SALT',        '@McIYyZ4bMyEa)Rc,K-|SW;v9.o<b c<i>_wk+i-B-!V$h]H20ZWCDy8xOu2>*l)');
define('SECURE_AUTH_SALT', '4L%e<+M;`u@`]dtx?E{Q+;vkL})-,s&9v(ug)y8 %||e :~:{.s;hjV0sJ-sKI /');
define('LOGGED_IN_SALT',   '}B*+jw;RLIw0O3OnB-CndgZO8}b`EkE|/~.lt)g-!LE-q<!z##m.9%rE{)JK#SI<');
define('NONCE_SALT',       'G70YT6$yxZ}7#wPOr f6%-ybtd#xxfJe^v[]k >7|#Q0YWTJ#}s- t|<YuK%Qd!H');

/**#@-*/

/**
 * WordPress database table prefix.
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php'; 