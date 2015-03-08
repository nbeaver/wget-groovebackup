=========================================
A minimal script to download Groovebackup
=========================================

------------
Instructions
------------

#. Go to https://groovebackup.com/ and log into Grooveshark as instructed.

#. Once at https://groovebackup.com/home/ export cookies from the browser.

   (Only the cookies for the ``.groovebackup.com`` domain are necessary.)
   
   Firefox addon to export cookies file (exports all domains):
   
   https://addons.mozilla.org/en-US/firefox/addon/export-cookies/
   
   (I have not had much luck getting Firefox to work with Groovebackup.)
   
   Chromium addon to export cookies file (exports only current domain, so navigate to https://groovebackup.com/home/ first):
   
   https://chrome.google.com/webstore/detail/cookietxt-export/lopabhfecdfhgogdbojmaicoicjekelh?hl=en

#. Put the ``cookies.txt`` file into the same directory as `wget-groovebackup.sh <wget-groovebackup.sh>`_

#. Run `wget-groovebackup.sh <wget-groovebackup.sh>`_

-----------
Limitations
-----------

Groovebackup.com only backs up your Grooveshark Collection, Favorites, and Playlists.
It does not save playlist descriptions.

The playlists are saved as UTF-8 CSV files
containing the song name, artist name, and album name only.

----
TODO
----

Cookies from groovebackup seem to only last about 24 hours.
