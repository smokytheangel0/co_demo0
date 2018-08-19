#!/usr/bin/python3
import webbrowser
import platform
import getpass
import urllib.request
import zipfile
import sys
import os

"""
TODO
rename git clone paths, taking into account the directories made
in create_directories(), remember to do it after the flutter create step
or dl it into Downloads/ and mv it to flutter created directory
in the packaging step, keeping an eye on the results of identical item
replacement after the move step

halfCASE and straight for boxes
snake_case for functions and methods
CamelHALF and Upper for classes or Propa_Snake_Case for long class names
SCREAMING_SNAKE_CASE FOR GLOBAL TYPE THINGS

create complex android download

finish setup_downloads()

debug set_path()

show_licence()

create_package()

inline_test()

restack main()

rust => ship
"""

def check_dir(errorBOX):
    #this has been tested in windows, mac and linux
    initial_directory = os.getcwd()

    if "Downloads" not in initial_directory:
        for line in errorBOX[0]:
            print(line)
        sys.exit()


def start_downloads(errorBOX):
    #this has been tested in mac, windows and linux
    #SSL certificate mismatch is holding up mac
    #there is a chance we can do 100% with browser
    #but we would need to change ID names

    #windows and linux work, tested the sudo
    #the password field is immediately occupied by the
    #browser pop up message, but it is still operable

    #these do not add copies when run more than once, it
    #appears it either rewrites them or fails on file name error (uncaught, blank trys)

    #this will probably be split when rusted
    #into two threads which can complete 
    #the download and extract/install functions
    #for each SDK seperately and finish when
    #the download does instead of waiting up
    system = platform.uname()[0]

    if system == "Linux":
        vs_version = "linux64_deb"
        extension = "zip"
    #need to do apt get for git on linux

    if system == "Windows":
        vs_version = "win32"
        extension = "exe"
        #problem with this one if any will be the 64 bit part at the end
        git_url = "https://github.com/git-for-windows/git/releases/download/v2.18.0.windows.1/Git-2.18.0-64-bit.exe"

    if system == "Darwin":
        vs_version = "osx"
        extension = "dmg"
        git_url = "https://sourceforge.net/projects/git-osx-installer/files/git-2.18.0-intel-universal-mavericks.dmg/download?use_mirror=autoselect"


    #should download the co_demo here and unpack it later with flutter
    url = "https://github.com/smokytheangel0/co_demo0/archive/master.zip"

    try:
        urllib.request.urlretrieve(url, "co_demo.zip")
    except:
        for line in errorBOX[1]:
            if line == errorBOX[1][0]:
                line = errorBOX[1][0].split()
                line[1] = "co_demo"
                line = " ".join(line)
            print(line)
        sys.exit()

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

    #one more here for git
    try:
        if system == "Linux":
            os.system("sudo apt install git")
        else:
            urllib.request.urlretrieve(git_url, "git_scm."+extension)
    except:
        for line in errorBOX[1]:
            if line == errorBOX[1][0]:
                line = errorBOX[1][0].split()
                line[1] = "git scm"
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

    url = "https://developer.android.com/studio/#downloads"

    try:
        webbrowser.open(url, new=0, autoraise=True)
    except:
        for line in errorBOX[1]:
            if line == errorBOX[1][0]:
                line = errorBOX[1][0].split()
                line[1] = "android"
                line = " ".join(line)
            print(line)
        sys.exit()


def wait_till_complete(errorBOX):
    #the nested for correctly IDs in Win, Mac and Linux
    #we will leave this as is and create some recalling logic
    #in main
    system = platform.uname()[0]

    filesNeeded = {
                    'android-studio-ide' : None, 
                    'git_scm': None, 
                    'vs_code': None, 
                    'flutter_sdk': None, 
                    'co_demo': None
                }

    filesInDirectory = os.listdir('.')

    for download in filesInDirectory:
        for fileBOX in filesNeeded.keys():
            if fileBOX in download:
                if '.crdownload' in download:
                    filesNeeded[fileBOX] = False
                elif '.partial' in download:
                    filesNeeded[fileBOX] = False
                elif '.part' in download:
                    filesNeeded[fileBOX] = False
                else:
                    filesNeeded[fileBOX] = True

    return filesNeeded 

def setup_downloads(option, errorBOX):
    pass
    #this is where we will extract and start executables

def create_directories(errorBOX):
    #this has been tested in isolation, os.getlogin
    #does not always work
    system = platform.uname()[0]
    user_name = getpass.getuser()

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
        pass

    if system == "Windows":
        dirBOX = "C:\\Users\\"+user_name+"\\Desktop\\SDKs\flutter\bin"
        path = path + dirBOX + ";"
        os.environ["PATH"] = path

    if system == "Darwin":    #Darwin?
        pass

def show_licences(errorBOX):
    pass

def inline_test(errorBOX):
    #this is where we look around to make sure
    #everything is where it needs to be
    pass

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
    #need some recheck logic if this returns anything but 5 Trues
    #and it may need some logic if Nones are returned after a time out
    #(all files should at least have started downloading, so the user missed android)
    filesNeeded = wait_till_complete(errorBOX)
    

    create_directories(errorBOX)
    setup_downloads(option, errorBOX)

    set_path(errorBOX)
    show_licences(errorBOX)
    inline_test(errorBOX)
    create_package(errorBOX)

if __name__ == "__main__":
    main()