#!/bin/bash
awk '
{
    lines[NR] = $0
}

END {
    for (i = 1; i <= NR; i++) {

        current_has_text = (lines[i] ~ /[^[:space:]]/)
        next_has_text    = (i < NR && lines[i+1] ~ /[^[:space:]]/)
        has_backslash    = (lines[i] ~ /\\$/)
	has_hashtag = (lines[i] ~ /^\#/)

        if (current_has_text && next_has_text && !has_backslash && !has_hashtag) {
            print lines[i] "\\"
        } else {
            print lines[i]
        }
    }
}
' "$1"
