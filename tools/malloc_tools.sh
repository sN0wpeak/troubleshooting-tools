#!/bin/bash

gdb --batch --pid  $PID --ex 'call malloc_trim()'