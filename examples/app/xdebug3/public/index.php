<?php

var_dump([
    'directory' => 'xdebug3',
    'hostname' => gethostname(),
    'version' => phpversion(),
    'xdebug' => phpversion('xdebug'),
]);

user_error('Demo', E_USER_NOTICE);
user_error('Demo', E_USER_WARNING);
user_error('Demo', E_USER_ERROR);
