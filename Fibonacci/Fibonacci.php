<?php

function fibonacci($n) {
   $F_n = 1;
   $F_nm1 = 0;
   for ($i = 0; $i < $n; $i++) {
     $F_old = $F_n;
     $F_n = $F_n + $F_nm1;
     $F_nm1 = $F_old;
   }
   echo "$F_nm1\n";
}

fibonacci($argv[1]);
?>
