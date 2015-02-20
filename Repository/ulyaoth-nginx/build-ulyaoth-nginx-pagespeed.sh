useradd ulyaoth
cd /home/ulyaoth/
mkdir -p /etc/nginx/modules/pagespeed
chown -R ulyaoth:ulyaoth /etc/nginx
su ulyaoth -c "rpmdev-setuptree"
su ulyaoth -c "wget https://github.com/pagespeed/ngx_pagespeed/archive/release-1.9.32.3-beta.zip"
su ulyaoth -c "wget https://dl.google.com/dl/page-speed/psol/1.9.32.3.tar.gz"
su ulyaoth -c "unzip release-1.9.32.3-beta.zip"
su ulyaoth -c "tar xvf 1.9.32.3.tar.gz"
su ulyaoth -c "cp -rf ngx_pagespeed-release-1.9.32.3-beta/* /etc/nginx/modules/pagespeed/"
su ulyaoth -c "mv psol/ /etc/nginx/modules/pagespeed/"
su ulyaoth -c "rm -rf /etc/nginx/modules/pagespeed/psol/lib/Debug/linux/ia32"
su ulyaoth -c "rm -rf /etc/nginx/modules/pagespeed/psol/lib/Release/linux/ia32"
su ulyaoth -c "rm -rf 1.9.32.3.tar.gz ngx_pagespeed-release-1.9.32.3-beta release-1.9.32.3-beta.zip"
cd /etc/nginx/modules/pagespeed/
su ulyaoth -c "tar cvf pagespeed.tar.gz scripts/ test/"
su ulyaoth -c "mv pagespeed.tar.gz /home/ulyaoth/rpmbuild/SOURCES/"
cd /home/ulyaoth/rpmbuild/SOURCES/
su ulyaoth -c "wget http://nginx.org/download/nginx-1.6.2.tar.gz"
su ulyaoth -c "wget https://raw.githubusercontent.com/sbagmeijer/ulyaoth/master/Repository/ulyaoth-nginx/SOURCES/logrotate"
su ulyaoth -c "wget https://raw.githubusercontent.com/sbagmeijer/ulyaoth/master/Repository/ulyaoth-nginx/SOURCES/nginx-pagespeed.conf"
su ulyaoth -c "wget https://raw.githubusercontent.com/sbagmeijer/ulyaoth/master/Repository/ulyaoth-nginx/SOURCES/nginx.init"
su ulyaoth -c "wget https://raw.githubusercontent.com/sbagmeijer/ulyaoth/master/Repository/ulyaoth-nginx/SOURCES/nginx.service"
su ulyaoth -c "wget https://raw.githubusercontent.com/sbagmeijer/ulyaoth/master/Repository/ulyaoth-nginx/SOURCES/nginx.suse.init"
su ulyaoth -c "wget https://raw.githubusercontent.com/sbagmeijer/ulyaoth/master/Repository/ulyaoth-nginx/SOURCES/nginx.sysconf"
su ulyaoth -c "wget https://raw.githubusercontent.com/sbagmeijer/ulyaoth/master/Repository/ulyaoth-nginx/SOURCES/nginx.upgrade.sh"
su ulyaoth -c "wget https://raw.githubusercontent.com/sbagmeijer/ulyaoth/master/Repository/ulyaoth-nginx/SOURCES/nginx.vh.default.conf"
su ulyaoth -c "wget https://raw.githubusercontent.com/sbagmeijer/ulyaoth/master/Repository/ulyaoth-nginx/SOURCES/nginx.vh.example_ssl.conf"
cd /home/ulyaoth/rpmbuild/SPECS
su ulyaoth -c "wget https://raw.githubusercontent.com/sbagmeijer/ulyaoth/master/Repository/ulyaoth-nginx/SPECS/ulyaoth-nginx-pagespeed.spec"
yum-builddep -y /home/ulyaoth/rpmbuild/SPECS/ulyaoth-nginx-pagespeed.spec
su ulyaoth -c "rpmbuild -bb ulyaoth-nginx-pagespeed.spec"
cp /home/ulyaoth/rpmbuild/RPMS/x86_64/* /root/
rm -rf /home/ulyaoth/rpmbuild/
rm -rf /etc/nginx
rm -rf /root/build-ulyaoth-nginx-pagespeed.sh