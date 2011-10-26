class graylog2::web {
  include graylog2::web::common
  include graylog2::web::install
  include graylog2::web::config
  include graylog2::web::service
}

