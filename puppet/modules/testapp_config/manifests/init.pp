class testapp_config {
# Create app directory and set ownership
   file { '/home/myapp':
     ensure => "directory",
     owner => "root",
     group => "root",
     mode => "755",
   }
# notice: /Stage[main]/Testapp_config/File[/home/myapp]/ensure: created

# Create VHost for app directory
   apache::vhost { 'testapp_config':
     servername => 'default',
     port     => '80',
     docroot  => '/home/myapp/public',
     priority => '10',
     options => ['-MultiViews'],
   }
# notice: /Stage[main]/Testapp_config/Apache[vhost:testapp]/vhost: created

   package { 'bundler':
     ensure   => 'installed',
     provider => 'gem',
   }
# notice: /Stage[main]/Testapp_config/Package[bundler]/ensure: created
}
