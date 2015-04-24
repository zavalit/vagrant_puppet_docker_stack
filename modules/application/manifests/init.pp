class application {

   include docker

   $application_dir = '/opt/corouser'

   file { $application_dir:
     ensure => directory,
     source => 'puppet:///modules/application/corouser/vendor',
     force  => true,
     recurse => true,
   }

   ::docker::image { 
    'zavalit/corouser':
     require    => File[$application_dir],
   }

   ::docker::run { 
    'corouser':
    image => 'zavalit/corouser',
    volumes => "/opt/corouser:/var/www",
    ports => ['8081:8081'],
    require => Docker::Image['zavalit/corouser'],
   }

}
