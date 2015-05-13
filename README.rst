=========================================
A minimal script to download Groovebackup
=========================================

.. Note::

  Grooveshark went offline on April 30, 2015 as part of a legal settlement.
  Groovebackup was briefly available afterward before redirecting.
  This means this script will not work anymore,
  and is only archived here for posterity.

----------
Motivation
----------

Grooveshark was `dying`_ in 2013.
It's all but `dead`_ in 2015.
Songs are `rapidly`_ `disappearing`_ `from`_ its catalog `due to`_ `DMCA takedown requests`_.

You can migrate your playlists using sites like `Soundiiz`_,
but not your collection or favorites.
For that, you will need to use `Groovebackup`_.
This is a bash script to download Groovebackup with `wget`_.

.. _dying: http://mashable.com/2013/04/22/grooveshark-radio/
.. _dead: http://www.wsj.com/articles/grooveshark-tries-to-play-by-the-rules-with-online-radio-app-1418014861
.. _rapidly: https://www.reddit.com/r/grooveshark/comments/sje69/is_anyone_else_finding_that_lots_of_songs_are/
.. _disappearing: https://answers.yahoo.com/question/index?qid=20120507183932AArp6Mf
.. _from: https://www.reddit.com/r/groovesharkplaylists/comments/1rffzv/are_songs_still_disappearing_from_grooveshark/
.. _Soundiiz: http://soundiiz.com/#/converter
.. _Groovebackup: http://groovebackup.com/
.. _wget: https://www.gnu.org/software/wget/
.. _due to: https://www.quora.com/Is-Grooveshark-totally-not-worth-using-now-Broken?share=1
.. _DMCA takedown requests: http://www.theguardian.com/music/musicblog/2011/dec/12/grooveshark-music-site

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

It does not use HTTPS.

The playlists are saved as UTF-8 CSV files
containing the song name, artist name, and album name only.

Cookies only last a few hours.
