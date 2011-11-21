define gl2appliance($webmaster='webmaster@localhost') {

  include mongo
  include rvm
  include graylog2::common
  include graylog2::server
}
