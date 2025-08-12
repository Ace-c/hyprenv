#!/bin/bash

# current media info
song_info=$(playerctl metadata --format '{{title}} | {{artist}} | {{playerName}}' 2>/dev/null)


if [[ -n "$song_info" ]]; then
    # Show media info if playing
    echo "$song_info"
else
    # quotes
    quotes=(
        "“Be yourself; everyone else is already taken.” — Oscar Wilde"
        "“Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.” — Albert Einstein"
        "“So many books, so little time.” — Frank Zappa"
        "“Be the change that you wish to see in the world.” — Mahatma Gandhi"
        "“In three words I can sum up everything I've learned about life: it goes on.” — Robert Frost"
        "“If you tell the truth, you don't have to remember anything.” — Mark Twain"
        "“A friend is someone who knows all about you and still loves you.” — Elbert Hubbard"
        "“To live is the rarest thing in the world. Most people exist, that is all.” — Oscar Wilde"
        "“Without music, life would be a mistake.” — Friedrich Nietzsche"
        "“We accept the love we think we deserve.” — Stephen Chbosky"
        "“Imperfection is beauty, madness is genius and it's better to be absolutely ridiculous than absolutely boring.” — Marilyn Monroe"
        "“Good friends, good books, and a sleepy conscience: this is the ideal life.” — Mark Twain"
        "“The only way to do great work is to love what you do.” — Steve Jobs"
        "“Not all those who wander are lost.” — J.R.R. Tolkien"
        "“Do what you can, with what you have, where you are.” — Theodore Roosevelt"
    )

    # current timestamp
    current_time=$(date +%s)
    
    # quote display time function 
    if [[ -f "/tmp/current_quote" && $(($current_time - $(date -r /tmp/current_quote +%s))) -lt 15 ]]; then
        cat /tmp/current_quote
    else
        # Select new random 
        random_index=$((RANDOM % ${#quotes[@]}))
        selected_quote="${quotes[$random_index]}"
        
        # Cache the quote with timestamp
        echo "$selected_quote" > /tmp/current_quote
        echo "$selected_quote"
    fi
fi