class graylog2::server {
  include graylog2::server::install
  include graylog2::server::config
  include graylog2::server::service
}
