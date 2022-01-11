Set with xsetroot. Examples:  
 - Simple example  
`xsetroot -bitmap [selection].xbm`  
 - Add colors  
`xsetroot -bitmap [selection].xbm -bg "color" -fg "color"`  
 - Leverage current colors from xrdb  
`xsetroot -bitmap [selection].xbm "$(xrdb -query|awk '/\*color8:/ {print $2})" -fg "$(xrdb -query|awk '/\*color7:/ {print $2}')"`  

