#!/usr/bin/env python
import os, shutil

# Make files in the home directory symlink to here
pwd = os.getcwd()
for f in os.listdir('home'):

    try:
        # Copy each file, prepending a . to hide it
        link_from = os.path.expanduser("~") + '/.' + f
        link_to = pwd + '/home/' + f
        print "linking from {} to {}...".format(link_from, link_to)
        os.symlink(link_to, link_from)

    except OSError as e:
        # 17 is "file already exists"
        if e.errno == 17:
            # If these are equal, we're already linked properly. Otherwise crash.
            if os.path.realpath(link_from) != os.path.realpath(link_to):
                raise IOError('please delete {}...'.format(link_from))
        else:
            raise
