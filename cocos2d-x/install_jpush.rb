#!/usr/bin/env ruby

system("echo working ...")
system("sudo gem install xcodeproj")


require 'xcodeproj'
require 'open-uri'
require 'fileutils'
require  'find'



src_dir = Dir.getwd
jpush_sdk_d = src_dir + "/jpush_sdk"
appkey = ARGV[1]
projectName = ARGV[3]

## download
open('jpush_sdk.zip', 'wb') do |file|
    puts "Downloading JPush SDK ..."
    file << open('https://www.jpush.cn/downloads/sdk/ios8/').read
    system("mkdir jpush_sdk")
    FileUtils.mv file,jpush_sdk_d
end

open('JPushBridge.h','wb') do |file|
    puts "Downloading JPushBridge.h ..."
    file << open('https://raw.githubusercontent.com/jpush/jpush-cocos2d-x-plugin/master/iOS/JPushPlugin/JPushBridge.h').read
    FileUtils.mv file,jpush_sdk_d
end

open('JPushBridge.mm','wb') do |file|
    puts "Downloading JPushBridge.h ..."
    file << open('https://raw.githubusercontent.com/jpush/jpush-cocos2d-x-plugin/master/iOS/JPushPlugin/JPushBridge.mm').read
    FileUtils.mv file,jpush_sdk_d
end


## zip move delete
system("unzip -o #{jpush_sdk_d+"/jpush_sdk"} -d #{jpush_sdk_d}")
system("mv #{jpush_sdk_d+"/JPush-iOS-SDK-2.1.7/lib/jpush-ios-2.1.7.a"} #{jpush_sdk_d+"/"}")
system("mv #{jpush_sdk_d+"/JPush-iOS-SDK-2.1.7/lib/JPUSHService.h"} #{jpush_sdk_d+"/"}")
system("rm -rf #{jpush_sdk_d+"/__MACOSX"}")
system("rm -rf #{jpush_sdk_d+"/JPush-iOS-SDK-2.1.7"}")
system("rm -rf #{jpush_sdk_d+"/jpush_sdk.zip"}")


## add file

project = Xcodeproj::Project.open(src_dir+'/'+projectName+".xcodeproj")

target = project.targets.first

group = project.main_group.find_subpath(File.join('jpush_sdk'), true)

group.set_source_tree('SOURCE_ROOT')

file_ref1 = group.new_reference(jpush_sdk_d+"/jpush-ios-2.1.7.a")
file_ref2 = group.new_reference(jpush_sdk_d+"/JPUSHService.h")
file_ref3 = group.new_reference(jpush_sdk_d+"/JPushBridge.h")
file_ref4 = group.new_reference(jpush_sdk_d+"/JPushBridge.mm")

target.add_file_references([file_ref1])
target.add_file_references([file_ref2])
target.add_file_references([file_ref3])
target.add_file_references([file_ref4])

target.add_system_frameworks("CFNetwork")
target.add_system_frameworks("CoreFoundation")
target.add_system_frameworks("CoreTelephony")
target.add_system_frameworks("CoreGraphics")
target.add_system_frameworks("Foundation")
target.add_system_frameworks("UIKit")
target.add_system_frameworks("Security")
target.add_system_frameworks("SystemConfiguration")
target.add_system_libraries("z")
target.add_system_frameworks("AdSupport")

project.save

## add code

appDelegate_path = ""

def searchFor(name)
    Find.find(Dir.getwd) do |filename|
        if filename.include?name
            return filename
        end
    end
end

appDelegate_path = searchFor("AppController.mm")


appDelegate_path_temp = appDelegate_path
appDelegate_path_temp = appDelegate_path_temp.chop

open(appDelegate_path_temp,"w") do |test|
    open(appDelegate_path, 'r') do |file|
        file.each_line do |line|
            if line.start_with?('#import "AppDelegate.h"')
                test.print line
                test.print '#import "JPUSHService.h"'
                test.print "\n"
                elsif line.start_with?("- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {")


                test.puts "- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{ \n\
                // JPush sdk \n\
                [JPUSHService registerDeviceToken:deviceToken]; \n\
                }"

                test.puts "\n"
                test.puts "- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo { \n\
                // JPush sdk \n\
                [JPUSHService handleRemoteNotification:userInfo];   \n\
                }"
                test.print "\n"


                test.puts "//IOS7 only  \n\
                - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {    \n\
                [JPUSHService handleRemoteNotification:userInfo];   \n\
                completionHandler(UIBackgroundFetchResultNewData);  \n\
                }"
                test.print "\n"


                test.print line
                test.print "    //JPush sdk"
                test.print "\n"
                test.print '    [JPUSHService setupWithOption:launchOptions appKey:@"'+appkey+'" channel:@"" apsForProduction:NO advertisingIdentifier:nil];'
                test.puts "\n\n\n"


                test.puts "#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1 \n\
                if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) { \n\
                //可以添加自定义categories \n\
                [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge | \n\
                UIUserNotificationTypeSound | \n\
                UIUserNotificationTypeAlert)  \n\
                categories:nil];  \n\
                } else {    \n\
                //categories 必须为nil \n\
                [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |   \n\
                UIRemoteNotificationTypeSound |   \n\
                UIRemoteNotificationTypeAlert)    \n\
                categories:nil];  \n\
                }   \n\
                #else   \n\
                //categories 必须为nil \n\
                [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |   \n\
                UIRemoteNotificationTypeSound |   \n\
                UIRemoteNotificationTypeAlert)    \n\
                categories:nil];  \n\
                #endif    \n"


                else
                test.print line
            end
        end
    end
end

File.open(appDelegate_path,"w") do |test|
    File.open(appDelegate_path_temp,'r') do |file|
        file.each_line do | line|
            test.print line
        end
    end
end

system("rm -rf #{appDelegate_path_temp}")
puts appDelegate_path_temp
puts "JPush Cocos2d-x Plugin installed successfully,have fun!"
