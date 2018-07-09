import time
from tools import DB
import actmon
import signal
import sys
import pdb
import datetime
import select
import os


def main():

    #the interface should ask if you want to view hours or record a new session

    #recorder should write a command, a session number (edit tools should already be in there or truck)
    #  and a datetime object 
    #   (t stamp is built in) (command should be start play pause stop)
    # this reports milliseconds i think

    pause_switch = 0
    max_chars = 128

    BaseBOX = ["clock", "stamps"]
    fieldBOX = "comment, session, command"
    InBOX = [BaseBOX, fieldBOX]
    db = DB(InBOX)

    print "would you like to [r]ecord or view sessions ?>"
    inBOX = raw_input("?> ")

    if inBOX.lower().startswith("r"):
        db.db.execute("SELECT * from stamps")
        ThisBOX = db.db.fetchall()
        try:
            session_number = ThisBOX[-1][1]
            session_number += 1
        except IndexError:
            session_number = 0

        ThisBOX = []

        print "session started !>"
        DataBOX = [
            str(datetime.datetime.now()),
            session_number,
            "start"
        ]
        InBOX0 = [BaseBOX, "insert", DataBOX]
        db.write(InBOX0)



        while True:
            try:
                #this may not be mathed right but for some reason it still works
                idle_time = actmon.get_idle_time() / 1000
                if idle_time > 300:
                    #view a switch in here that says
                    #whither this has been triggered all ready or not
                    #if it has then dont print
                    #if it hasnt then do print
                    #set it when you print
                    if pause_switch == 1:
                        pass
                    else:
                        DataBOX = [
                            str(datetime.datetime.now()),
                            session_number,
                            "pause"
                        ]
                        InBOX0 = [BaseBOX, "insert", DataBOX]
                        db.write(InBOX0)

                        print "session paused !>"
                        pause_switch = 1
                else:
                    os.system('cls' if os.name == 'nt' else 'clear')

                    try:
                        import tty, termios
                        prev_flags = termios.tcgetattr(sys.stdin.fileno())
                        tty.setraw(sys.stdin.fileno())
                    except ImportError:
                        prev_flags = None
                    sys.stderr.write("["+str(session_number)+"] comment ?>")

                    comment_box = ''

                    while True:
                        inputBOX, outputBOX, errorBOX = select.select([sys.stdin], [], [], 110)
                        if inputBOX:
                            char = sys.stdin.read(1)
                            if char == '\n':
                                break
                            elif char == '':
                                break
                            comment_box += char
                            sys.stderr.write(char)
                                
                            if len(comment_box) >= max_chars:
                                break
                        else:
                            break
                    if prev_flags is not None:
                        termios.tcsetattr(sys.stdin.fileno(), termios.TCSADRAIN, prev_flags)

                    sys.stderr.write('\n')

                    print "session ongoing !>"
                    print "press [CTRL]+C to stop session"
                    if comment_box == "":
                        comment_box = datetime.datetime.now()
                    DataBOX = [
                        comment_box,
                        session_number,
                        "play"
                    ]
                    InBOX0 = [BaseBOX, "insert", DataBOX]
                    db.write(InBOX0)

                    pause_switch = 0

                time.sleep(10)
            except KeyboardInterrupt:
                DataBOX = [
                    str(datetime.datetime.now()),
                    session_number,
                    "stop"
                ]
                InBOX0 = [BaseBOX, "insert", DataBOX]
                db.write(InBOX0)

                print "session stopped !>"
                sys.exit(0)
    else:
        print "please enter a session number ?>"
        inBOX = raw_input("?> ")
        db.db.execute("select * from stamps where session=(?)",(int(inBOX),))
        session_records = db.db.fetchall()

        total_time = session_records[-1][3] - session_records[0][3]

        pp_records = []
        index = 0
        while index < len(session_records):
            if session_records[index][2] == 'pause':
                pp_records.append(session_records[index])
                pp_records.append(session_records[index+1])
            index += 1

        counter = 0
        total_idle = 0.0
        current_idle = 0.0
        while counter < len(pp_records):
            if pp_records[counter][2] == 'pause':
                current_idle = pp_records[counter+1][3] - pp_records[counter][3]
                total_idle += current_idle
            else:
                pass
            counter+= 1  
            
        work_time = total_time -  total_idle

        print "for session number "+inBOX+" !>"
        print "the work time was "+str(float(work_time)/60/60)+" hrs"
        print "the idle time was "+str(float(total_idle)/60/60)+" hrs"


if __name__ == "__main__":
    main()
