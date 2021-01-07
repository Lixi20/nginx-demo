lexer grammar NginxLexer;

JING: '#' .*? '\n'+;
USER:'user';
WORKER_PROCESSES:'worker_processes';
ERROR_LOG:'error_log';
WORKER_RLIMIT_NOFILE:'worker_rlimit_nofile';
EVENTS:'events';
USE:'use';
WORKER_CONNECTIONS:'worker_connections';
HTTP:'http';
INCLUDE:'include';
DEFAULT_TYPE:'default_type';
LOG_FORMAT:'log_format';
ACCESS_LOG:'access_log';
SERVER_NAMES_HASH_BUCKET_SIZE:'server_names_hash_bucket_size';
SERVER_NAME_IN_REDIRECT:'server_name_in_redirect';
CLIENT_HEADER_BUFFER_SIZE:'client_header_buffer_size';
LARGE_CLIENT_HEADER_BUFFERS:'large_client_header_buffers';
SENDFILE:'sendfile';
TCP_NOPUSH:'tcp_nopush';
KEEPALIVE_TIMEOUT:'keepalive_timeout';
CLIENT_HEADER_TIMEOUT:'client_header_timeout';
CLIENT_BODY_TIMEOUT:'client_body_timeout';
SEND_TIMEOUT:'send_timeout';
GZIP:'gzip';
GZIP_MIN_LENGTH:'gzip_min_length';
GZIP_BUFFERS:'gzip_buffers';
GZIP_HTTP_VERSION:'gzip_http_version';
GZIP_COMP_LEVEL:'gzip_comp_level';
GZIP_TYPES:'gzip_types';
GZIP_VARY:'gzip_vary';
PROXY_REDIRECT:'proxy_redirect';
PROXY_SET_HEADER:'proxy_set_header';
CLIENT_MAX_BODY_SIZE:'client_max_body_size';
CLIENT_BODY_BUFFER_SIZE:'client_body_buffer_size';
PROXY_CONNECT_TIMEOUT:'proxy_connect_timeout';
PROXY_SEND_TIMEOUT:'proxy_send_timeout';
PROXY_BUFFER_SIZE:'proxy_buffer_size';
PROXY_BUFFERS:'proxy_buffers';
PROXY_BUSY_BUFFERS_SIZE:'proxy_busy_buffers_size';
PROXY_TEMP_FILE_WRITE_SIZE:'proxy_temp_file_write_size';
PROXY_NEXT_UPSTREAM:'proxy_next_upstream';
PROXY_MAX_TEMP_FILE_SIZE:'proxy_max_temp_file_size';
INDEX:'index';
PROXY_READ_TIMEOUT:'proxy_read_timeout';
SERVER:'server';
LISTEN:'listen';
SERVER_NAME:'server_name';
ROOT:'root';
AUTOINDEX:'autoindex';
AUTOINDEX_LOCALTIME:'autoindex_localtime';
CHARSET:'charset';
LOCATION:'location';

LEFT_OPENING_BRACE: '{';
RIGTH_OPENING_BRACE: '}';
LIFT_SQUARE: '[';
RIGHT_SQUARE: ']';
LOWER_STRING_WITH_UNDER_LINE: LOWER_STRING (UNDER_LINE LOWER_STRING)+;  //带或者不带下划线的字符串
LOWER_STRING: LOWER_ALPHABET+;        //0个或多个字符串
SPACE : ' '+;                          //空格
STRING_WITH_OTHER:  (LEFT_OPENING_BRACE
                    |RIGTH_OPENING_BRACE
                    |LOWER_ALPHABET   //小写字符串
                    |UNDER_LINE       //下划线
                    |NUMBER           //数字
                    |SLASH            //斜杠
                    |PLUS             //加号
                    |MINUS            //减号
                    |DOT              //小数点
                    |UPPER_ALPHABET   //大写字符串
                    |EQUALS_SIGN      //等号
                    |APOSTROPHE       //单引号
                    |DOUBLE           //双引号
                    |QIAN             //$
                    |LIFT_SQUARE      //[
                    |RIGHT_SQUARE     //]
                    )+;
STRING: ALPHABET+ ;                   //一个或多个字符串
LOWER_ALPHABET: [a-z0-9]+;
UPPER_ALPHABET: [A-Z];
ALPHABET: [a-zA-Z];
UNDER_LINE: '_';
NUMBER: [0-9];
SLASH: '/';
PLUS: '+';
MINUS: '-';
DOT: '.';
EQUALS_SIGN: '=';
S1_DELIMITER : ';'; // S1 delimiter
APOSTROPHE: ['] ;
DOUBLE: '"';
QIAN: '$';

WS : [\t\r\n]+ -> skip ; // skip spaces, tabs, newlines