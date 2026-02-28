#!/bin/bash

# 1. ps aux to list all processes and grep to filter
ps aux | grep nginx

# 2. pkill -f then the script name would work best
pkill -f my_script.sh

# 3. using nohup would keep the script running
nohup ./backup.sh

# 4. pgrep looks up and prints proccess id
pgrep sshd

# 5. you could see this using pstree, it would just print out the hieararchy
pstree

# 6. you could do lsof and then use -p to target the specific pid
lsof -p 1234

# 7. the command systemctl is-active would return the result
systemctl is-active docker

# 8. using nice to adjust the priority then changing it to -n 19 since its the lowerst
nice -n 19 ./heavy_calc.sh

# 9. you can use cp to copy but then do -r to make it recursive
cp -r /var/www/html /backup/html

# 10. use the same cp command up include -p to preserve
cp -p secret.key /tmp

# 11. you do this using a combination of command put together so it would be -a for archive -v for verbose and -u update which skips files.
rsync -avu src/ dest/

# 12. You would use the same command as before to check if newer
cp -u dir1/* dir2/

# 13. format of this using scp would go something like scp source user@host:filepath
scp app.conf user@192.168.1.50:/etc/

# 14. use a combination like before -c create, -z gzip -f file name
tar -czf archive.tar.gz /var/log

# 15. you could do -size and then specify for +500M
find /home -size +500M

# 16. -mtime and then use -7 for less than 7 days ago
find /var/log -mtime -7

# 17. -user and then the users name to find the files
find /tmp -user jenkins

# 18. doing -type d you can only target the directories then -empty for the empty ones and -delete removes them
find /data -type d -empty -delete

# 19. -perm to specify your looking for permissions
find . -perm 777

# 20. -exec will run the command on the file {} is just a placeholder
find . -name ".jpg" -exec cp {} /images/ \;

# 21. -E for extended -o prints matching part. we have you use a sequence of characters and numbers to extract the email itself.
grep -E -o "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}" contacts.txt

# 22. -i makes it to where capitization doesnt matter
grep -i "error" syslog

# 23. ^ to make sure its the start of the line
grep "^root" config.ini

# 24. -v is for the invert
grep -v "192.168.1.1" access.log

# 25. -r for recursive search like we done in a previous script
grep -r "TODO" .

# 26. sed -i edits file. syntax for substituting is s/filetofind/filetoreplace/g
sed -i "s/localhost/127.0.0.1/g" hosts.txt

# 27. -v like before for the invert match
grep -v "^#" config.conf

# 28. [0-9] means its a number and {1,3} means 1-3 digits long
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" file.txt

# 29. I believe you could just pipe the processes
ps aux | grep "^root"

# 30. Doing -l it will print the filename instead of just the line that has that content
find . -name "*.log" -exec grep -l "Critical" {} \;