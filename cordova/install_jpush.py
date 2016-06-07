#!/usr/bin/python
#install_jpush.py
# Copyright   2016.05.29  E.B. All rights reserved.

# 57380422@qq.com

context = {
"appkey"            : "undefined",
}

import sys
import os, os.path
import json
import shutil
import xml.etree.ElementTree as ET
import sys
import re
import glob



# ---------------------------- func ----------------------------

def jpushLog(arg):
    print("----- JPush log ----- \n "+arg)
#end of jpushLog function()


def dumpUsage():
    print "Usage: install_jpush.py -appkey yourAppkey"
    print "Options:"
    print "  -appkey    your Appkey (for example:997f28c1cea5a9f17d82079a) \n Get from JPush portal https://www.jpush.cn/common/apps"

# end of dumpUsage(context) function


def checkParams(context):

    # invalid invoke, tell users how to input params
    if len(sys.argv) < 3:
        dumpUsage()
        sys.exit()
    
    # find our params
    for i in range(1, len(sys.argv)):
        if "-appkey" == sys.argv[i]:
            # choose a scripting language
            context["appkey"] = sys.argv[i+1]
    
    # pinrt error log our required paramters are not ready
    raise_error = False
    if context["appkey"] == "undefined":
        print "Invalid -appkey parameter"
        raise_error = True
    if raise_error != False:
        sys.exit()

# end of checkParams(context) function


# ---------------------------- main ----------------------------

checkParams(context);
os.system("cordova plugin add cordova-plugin-device")
os.system("cordova plugin add jpush-phonegap-plugin --variable API_KEY=%s"%(context["appkey"]))
jpushLog("JPush Phonegap Plugin installed successfully,have fun!")
