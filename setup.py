import requests
import platform
import zipfile
import sys
import os
import git

"""
TODO
rename git clone paths, toking into account the directories made
in create_directories(), remember to do it after the flutter create step
or dl it into Downloads/ and mv it to flutter created directory
in the packaging step, keeping an eye on the results of identical item
replacement after the move step

test simple downloads and then create the complex one (android)

finish setup_downloads()

debug set_path()

show_licence()

create_package()

inline_test()

restack main()

rust => ship
"""

def check_dir(errorBOX):
    initial_directory = os.getcwd()

    if "Downloads" not in initial_directory:
        for line in errorBOX[0]:
            print(line)
        sys.exit()


def start_downloads(errorBOX):
    #this will probably be split when rusted
    #into two threads which can complete 
    #the download and extract/install functions
    #for each SDK seperately and finish when
    #the download does instead of waiting up
    system = platform.uname()[0]

    if system == "Linux":
        vs_version = "linux64_deb"
        extension = "zip"
    if system == "Windows":
        vs_version = "win32"
        extension = "exe"
    if system == "Darwin":
        vs_version = "osx"
        extension = "dmg"

    #this may fail on non linux platforms
    url = "https://github.com/flutter/flutter/archive/master.zip"

    try:
        urllib.request.urlretrieve(url, "flutter_sdk.zip")
    except:
        for line in errorBOX[1]:
            if line == errorBOX[1][0]:
                line = errorBOX[1][0].split()
                line[1] = "flutter"
                line = " ".join(line)
            print(line)
        sys.exit()

    #Download android studio here
    #this looks like we will have to pop open a browser
    #so they can accept the licence
    #the procedure is all js so this might be done

    #instead this should keep checking the dl folder to see A)
    #if the user has inited the dl ( if there is a file present at all)
    #and b if the hash matches and size matches (dl complete) + some time to finish
    url = "developer.android.com/studio/#downloads"

    try:
        urllib.request.urlretrieve(url, "android_studio."+extension)
    except:
        for line in errorBOX[1]:
            if line == errorBOX[1][0]:
                line = errorBOX[1][0].split()
                line[1] = "android"
                line = " ".join(line)
            print(line)
        sys.exit()

    #download visual studio code
    url = "https://code.visualstudio.com/docs/?dv="+vs_version

    try:
        urllib.request.urlretrieve(url, "vs_code."+extension)
    except:
        for line in errorBOX[1]:
            if line == errorBOX[1][0]:
                line = errorBOX[1][0].split()
                line[1] = "vs code"
                line = " ".join(line)
            print(line)
        sys.exit()


def setup_downloads(option, errorBOX):
    zip_ref = zipfile.ZipFile("flutter_sdk.zip", 'r')
    zip_ref.extractall("")
    zip_ref.close()


def create_directories(errorBOX):
    system = platform.uname()[0]
    user_name = os.getlogin()

    if system == "Linux":
        dirBOX = "/home/"+user_name+"/Desktop/"
        try:
            os.mkdir(dirBOX+"Code")
            os.mkdir(dirBOX+"SDKs")

        except NotImplementedError:
            for line in errorBOX[2]:
                print(line)
                sys.exit()

    if system == "Windows":
        dirBOX = "C:\\Users\\"+user_name+"\\Desktop\\"
        try:
            os.mkdir(dirBOX+"Code")
            os.mkdir(dirBOX+"SDKs")

        except NotImplementedError:
            for line in errorBOX[2]:
                print(line)
                sys.exit()

    if system == "Darwin":
        #this maybe horribly wrong
        dirBOX = "/home/"+user_name+"/Desktop/"
        try:
            os.mkdir(dirBOX+"Code")
            os.mkdir(dirBOX+"SDKs")

        except NotImplementedError:
            for line in errorBOX[2]:
                print(line)
                sys.exit()

def set_path(errorBOX):
    system = platform.uname()[0]
    user_name = os.getlogin()
    path = os.environ["PATH"]

    if system == "Linux":


    if system == "Windows":
        dirBOX = "C:\\Users\\"+user_name+"\\Desktop\\SDKs\flutter\bin"
        path = path + dirBOX + ";"
        os.environ["PATH"] = path

    if system == "Darwin":    #Darwin?

def show_licences(errorBOX):
    pass

def inline_test(errorBOX):
    #this is where we look around to make sure
    #everything is where it needs to be
    pass

def get_source(errorBOX):  
    git.Git("/your/directory/to/clone").clone("git://gitorious.org/git-python/mainline.git")

def create_package(errorBOX):
    #this is where we will run
    #flutter create in the code folder
    #and then extract the source over
    #the premade stuff
    pass



def main():
    errorBOX = [    
                    ["This program you've just run does",
                    "not appear to be in the Downloads",
                    "folder, please try again with it",
                    "in there"],

                    ["The __None_ download failed, please",
                    "please try running program again to",
                    "restart"],

                    ["This System does not appear to allow",
                    "the creation of directories in your",
                    "Desktop directory."],

                    [""]

                ]
    
    check_dir(errorBOX)

    #these three will be bumped onto another
    #thread when we rust this script out
    start_downloads(errorBOX)
    install_android(errorBOX)
    extract_flutter(errorBOX)

    create_directories(errorBOX)
    set_path(errorBOX)
    show_licences(errorBOX)


if __name__ == "__main__":
    main()