:LOOP
git pull
timeout /T 15 /NOBREAK 
::pause or sleep x seconds also valid
if not ErrorLevel 1 goto :LOOP
