require 'unirest'

# vars for coloured output
red	= "\033[01;31m"
green = "\033[01;32m"
default = "\033[0m"

# A list of common admin directories to probe
pages	=	['admin/','administrator/','admin1/','admin2/','admin3/','admin4/',
        'admin5/','usuarios/','usuario/','administrator/','moderator/','webadmin/',
        'adminarea/','bb-admin/','adminLogin/','admin_area/','panel-administracion/',
        'instadmin/','memberadmin/','administratorlogin/','adm/','admin/account.php',
        'admin/index.php','admin/login.php','admin/admin.php','admin/account.php',
        'admin_area/admin.php','admin_area/login.php','siteadmin/login.php',
        'siteadmin/index.php','siteadmin/login.html','admin/account.html',
        'admin/index.html','admin/login.html','admin/admin.html','admin_area/index.php',
        'bb-admin/index.php','bb-admin/login.php','bb-admin/admin.php','admin/home.php',
        'admin_area/login.html','admin_area/index.html','admin/controlpanel.php',
        'admin.php','admincp/index.asp','admincp/login.asp','admincp/index.html',
        'admin/account.html','adminpanel.html','webadmin.html','webadmin/index.html',
        'webadmin/admin.html','webadmin/login.html','admin/admin_login.html',
        'admin_login.html','panel-administracion/login.html','admin/cp.php','cp.php',
        'administrator/index.php','administrator/login.php','nsw/admin/login.php',
        'webadmin/login.php','admin/admin_login.php','admin_login.php',
        'administrator/account.php','administrator.php','admin_area/admin.html',
        'pages/admin/admin-login.php','admin/admin-login.php','admin-login.php',
        'bb-admin/index.html','bb-admin/login.html','acceso.php','bb-admin/admin.html',
        'admin/home.html','login.php','modelsearch/login.php','moderator.php',
        'moderator/login.php','moderator/admin.php','account.php',
        'pages/admin/admin-login.html','admin/admin-login.html','admin-login.html',
        'controlpanel.php','admincontrol.php','admin/adminLogin.html','adminLogin.html',
        'admin/adminLogin.html','home.html','rcjakar/admin/login.php',
        'adminarea/index.html','adminarea/admin.html','webadmin.php',
        'webadmin/index.php','webadmin/admin.php','admin/controlpanel.html',
        'admin.html','admin/cp.html','cp.html','adminpanel.php','moderator.html',
        'administrator/index.html','administrator/login.html','user.html',
        'administrator/account.html','administrator.html','login.html',
        'modelsearch/login.html','moderator/login.html','adminarea/login.html',
        'panel-administracion/index.html','panel-administracion/admin.html',
        'modelsearch/index.html','modelsearch/admin.html','admincontrol/login.html',
        'adm/index.html','adm.html','moderator/admin.html','user.php','account.html',
        'controlpanel.html','admincontrol.html','panel-administracion/login.php',
        'wp-login.php','adminLogin.php','admin/adminLogin.php','home.php','admin.php',
        'adminarea/index.php','adminarea/admin.php','adminarea/login.php',
        'panel-administracion/index.php','panel-administracion/admin.php',
        'modelsearch/index.php','modelsearch/admin.php','admincontrol/login.php',
        'adm/admloginuser.php','admloginuser.php','admin2.php','admin2/login.php',
        'admin2/index.php','usuarios/login.php','adm/index.php','adm.php',
        'affiliate.php','adm_auth.php','memberadmin.php','administratorlogin.php']

# Take the arg passed with the script and assign it to link
link = ARGV.first

def welcome
  system "cls" or system "clear"
  puts """
    _       _           _         _____ _           _
   / \\   __| |_ __ ___ (_)_ __   |  ___(_)_ __   __| | ___ _ __
  / _ \\ / _` | '_ ` _ \\| | '_ \\  | |_  | | '_ \\ / _` |/ _ \\ '__|
 / ___ \\ (_| | | | | | | | | | | |  _| | | | | | (_| |  __/ |
/_/   \\_\\__,_|_| |_| |_|_|_| |_| |_|   |_|_| |_|\\__,_|\\___|_|

Ported to Ruby by Tom. (http://www.github.com/tbscanlon)
Original Python script by Arsh Leak. (http://www.github.com/4rsh)

"""
end

# print instructions on how to use the script if no args are passed
if link == nil
  puts "\tCorrect usage: ruby admin-finder.rb http://www.example.com"
  exit
else
  welcome
  puts "Probing: #{link} \n\n"
  pages.each do |page|
    response = Unirest.post link + "/" + page

    # print Success if the URL exists (HTTP 200), otherwise print Failed
    response.code != 200 ? puts("#{red}\tFailed [#{response.code}]: \t#{link}/#{page}#{default}") : puts("#{green}\tSuccess [#{response.code}]: \t#{link}/#{page}#{default}")
  end
end
