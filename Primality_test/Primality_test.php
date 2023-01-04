<?php

function isprime($n) {
    $found_divisor = false;
    if ($n <= 1) {
        return false;
    } else {
        for ($i = 2; $i <= sqrt($n); $i++) {
            $found_divisor = ($found_divisor or $n % $i == 0);
        }
        return !$found_divisor;
    }
}

function verbose_answer($n) {
    $wasit = isprime($n);
    $wasit ? $str_not = '' : $str_not = ' not';
    echo "$n is$str_not prime\n";
}

verbose_answer($argv[1]);
?>
