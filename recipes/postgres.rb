#
# Cookbook Name:: metroextractor
# Recipe:: postgres
#

%w(
  postgresql::server
  postgresql::contrib
  postgresql::postgis
).each do |r|
  include_recipe r
end

pg_database node[:metroextractor][:osm][:db] do
  owner     'postgres'
  encoding  'utf8'
  template  'template0'
end

pg_database_extensions node[:metroextractor][:osm][:db] do
  extensions  ['hstore']
  languages   'plpgsql'
  postgis     true
end
