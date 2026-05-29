#!/bin/bash
awk '
{
    lines[NR] = $0
}

END {
    for (i = 1; i <= NR; i++) {

        current_has_text = (lines[i] ~ /[^[:space:]]/)
        next_has_text = (i < NR && lines[i+1] ~ /[^[:space:]]/)

        # Add "\" only if:
        # - current line has text
        # - next line has text
        if (current_has_text && next_has_text) {
            print lines[i] "\\"
        } else {
            print lines[i]
        }
    }
}
' "$1"
