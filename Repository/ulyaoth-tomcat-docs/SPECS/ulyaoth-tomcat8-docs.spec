
%define __jar_repack %{nil}
%define debug_package %{nil}
%define tomcat_home /opt/tomcat
%define tomcat_group tomcat
%define tomcat_user tomcat

Summary:    Apache Servlet/JSP Engine
Name:       ulyaoth-tomcat8-docs
Version:    8.0.15
Release:    1%{?dist}
License:    Apache License version 2
Group:      Applications/Internet
URL:        http://tomcat.apache.org/
Vendor:     Apache Software Foundation
Packager:   Sjir Bagmeijer <sbagmeijer@ulyaoth.co.kr>
Source0:    apache-tomcat-%{version}.tar.gz
BuildRoot:  %{_tmppath}/tomcat-%{version}-%{release}-root-%(%{__id_u} -n)

Requires: ulyaoth-tomcat8

Provides: tomcat-docs
Provides: apache-tomcat-docs
Provides: ulyaoth-tomcat-docs
Provides: ulyaoth-tomcat8-docs

%description
The package contains the official Apache Tomcat "webapps/docs" directory.

%prep
%setup -q -n apache-tomcat-%{version}

%build

%install
install -d -m 755 %{buildroot}/%{tomcat_home}/
cp -R * %{buildroot}/%{tomcat_home}/

# Delete all files except webapp docs
%{__rm} -rf %{buildroot}/%{tomcat_home}/bin
%{__rm} -rf %{buildroot}/%{tomcat_home}/conf
%{__rm} -rf %{buildroot}/%{tomcat_home}/lib
%{__rm} -rf %{buildroot}/%{tomcat_home}/LICENSE
%{__rm} -rf %{buildroot}/%{tomcat_home}/NOTICE
%{__rm} -rf %{buildroot}/%{tomcat_home}/RELEASE-NOTES
%{__rm} -rf %{buildroot}/%{tomcat_home}/RUNNING.txt
%{__rm} -rf %{buildroot}/%{tomcat_home}/temp
%{__rm} -rf %{buildroot}/%{tomcat_home}/work
%{__rm} -rf %{buildroot}/%{tomcat_home}/logs
%{__rm} -rf %{buildroot}/%{tomcat_home}/webapps/examples
%{__rm} -rf %{buildroot}/%{tomcat_home}/webapps/ROOT
%{__rm} -rf %{buildroot}/%{tomcat_home}/webapps/host-manager
%{__rm} -rf %{buildroot}/%{tomcat_home}/webapps/manager

%clean
%{__rm} -rf $RPM_BUILD_ROOT

%files
%defattr(-,%{tomcat_user},%{tomcat_group})
%dir %{tomcat_home}/webapps/docs
%{tomcat_home}/webapps/docs/*

%post
cat <<BANNER
----------------------------------------------------------------------

Thanks for using ulyaoth-tomcat8-docs!

Please find the official documentation for tomcat here:
* http://tomcat.apache.org/

For any additional help please visit my forum at:
* http://www.ulyaoth.net

----------------------------------------------------------------------
BANNER

%changelog
* Mon Nov 17 2014 Sjir Bagmeijer <sbagmeijer@ulyaoth.co.kr> 8.0.15-1
- Creating separate package for the documentation.