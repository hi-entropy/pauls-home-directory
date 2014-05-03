import os, shutil

# make files in the home directory symlink to here
home_directory = raw_input('please enter home directory path: ')
pwd = os.getcwd()
for f in os.listdir('home'):
    failed = True

    while failed:
        failed = False
        try:
            # copy, prepending a .
            link_from = home_directory + '/.' + f
            link_to = pwd + '/home/' + f
            print link_from, link_to
            os.symlink(link_to, link_from)

        except OSError as e:
            # 17 is "file already exists"
            if e.errno == 17:
                # if these are equal, we're already linked properly
                if os.path.realpath(link_from) != os.path.realpath(link_to):
                    raw_input('please delete ' + link_from + ' ...')
                    failed = True
            else:
                raise e

    #shutil.copytree(f, 
