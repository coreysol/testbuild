class testapp_db {

# Create database
     postgresql::server::db { 'testapp_production':
       user     => 'testapp_production',
       password => postgresql_password('testapp_production', 'pr0d1'),
     }
     postgresql::server::db { 'testapp_test':
       user     => 'testapp_test',
       password => postgresql_password('testapp_test', 't3st1'),
     }
     postgresql::server::db { 'testapp_development':
       user     => 'testapp_development',
       password => postgresql_password('testapp_development', 'd3v1'),
     }
# notice: /Stage[main]/Testapp_db/postgresql/database: created

     postgresql::server::pg_hba_rule { 'allow application network to access app database':
       description => "Open up postgresql for access from all",
       type => 'host',
       database => 'all',
       user => 'all',
       address => '0.0.0.0/0',
       auth_method => 'md5',
     }
# notice: /Stage[main]/Testapp_db/postgresql/pg_hba rule: created
}
