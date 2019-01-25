_rogue=0.0.0.0 
echo -e "n=1\nwhile ! curl -k -o /tmp/hsts --silent https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts ; do\n\t[ \$n -gt 5 ] && break\n\tlet n+=1\n\tsleep 60\ndone\n" >/tmp/wh
echo -e "n=1\nwhile ! curl -k --silent https://raw.githubusercontent.com/HenningVanRaumle/pihole-ytadblock/master/ytadblock.txt >> /tmp/hsts ; do\n\t[\$n -gt 5 ] && break\n\tlet n+=1\n\tsleep 60\ndone\n" >>/tmp/wh
echo -e "n=1\nwhile ! curl -k -o /tmp/ytab --silent https://raw.githubusercontent.com/anudeepND/youtubeadsblacklist/master/domainlist.txt ; do\n\t[\$n -gt 5 ] && break\n\tlet n+=1\n\tsleep 60\ndone\n" >>/tmp/wh
echo -e "n=1\nwhile ! curl -k -o /tmp/ytabcustom --silent https://raw.githubusercontent.com/Excommunicated/ytabcustom/master/hosts.txt ; do\n\t[\$n -gt 5 ] && break\n\tlet n+=1\n\tsleep 60\ndone\n" >>/tmp/wh
echo -e "grep \"^0.0.0.0\" /tmp/hsts | grep \"^0.0.0.0\" | grep -v localhost | awk '{print \"$_rogue\\\t\"\$2}' | tr -d '\\\015' >/tmp/dlhosts\ngrep \"\" /tmp/ytab | awk '{print \"$_rogue\\\t\"\$1}' | tr -d '\\\015' >>/tmp/dlhosts\ngrep \"\" /tmp/ytabcustom | awk '{print \"$_rogue\\\t\"\$1}' | tr -d '\\\015' >>/tmp/dlhosts" >>/tmp/wh
echo -e "rm /tmp/hsts\nrm /tmp/ytab\nrm /tmp/ytabcustom\nkillall -HUP dnsmasq" >>/tmp/wh
sh /tmp/wh &
