<?php

define('DB_NAME', 'wordpress');

define('DB_USER', 'mtaiar-s');

define('DB_PASSWORD', '1234');

define('DB_HOST', 'localhost');

define('AUTH_KEY',         'Iue4kj%.c{2=*cN*b;@W:_N[^>zuge?JFa&c7#Ayf,^d)ov6u[yCF=3%4]sC0V~`');
define('SECURE_AUTH_KEY',  ',k51+PKw;i) IjBcX@h aw UX?+iL;pn0r`nE.w+Ax%d+@et7m6+xQ+[3q+vpu$;');
define('LOGGED_IN_KEY',    '4s-Ev63-[>SCfcwd@[oc#t3Q&H8_+rjaa=OBF?2K64`#(FT3hFz,zYz?+v3fO:d>');
define('NONCE_KEY',        'v.lXj}&!k$cZeAanUL*AeUV(Qo-h]0~Rhj?j{Flh] >o>$!di>.RrJ)aca9d#0=;');
define('AUTH_SALT',        '>,n<vKOlET~@cNrZ.M$B-tz+v@%7Pg*<&{7`ooe.IQ!|>SXf7S!wm31#-Nb}qfr ');
define('SECURE_AUTH_SALT', 'd{>M1 N^ibA=,4q%`5sPHi6z&qho79q_Le5d;=Lw3@baKpD5CG<5<6@MrQAC<mSu');
define('LOGGED_IN_SALT',   '(fqYnz=K$89vSEP3m[lTv&-wUORcKoSPl-w:(A*6*++&(du~<Os]_/UDEJ+@s2`t');
define('NONCE_SALT',       ';?xUkOykv@R-DTr@Dus*|3Q7k#xaU_$rKId~GMaf]x,tks~Zry LsP<F)n/@tKQ ');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
?>
