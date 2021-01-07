parser grammar NginxParser;

options {
    tokenVocab = NginxLexer;
}

input : all input
        |EOF;

jing : JING;

all : jing|user|events|http;



user : user_left (op=SPACE fg_right)+ SPACE* delimiter;


events : events_name op=SPACE events_value;
events_name : EVENTS;
events_value : LEFT_OPENING_BRACE SPACE events_group+  RIGTH_OPENING_BRACE;
events_group: SPACE* events_left (op=SPACE fg_right)+ delimiter;

http : http_name op=SPACE http_value;
http_name : HTTP;
http_value : LEFT_OPENING_BRACE (SPACE|http_group|server)* RIGTH_OPENING_BRACE;
http_group : SPACE* http_left (op=SPACE+ fg_right)+ delimiter;


server : server_name op=SPACE server_value;
server_name : SERVER;
server_value : LEFT_OPENING_BRACE (SPACE|server_group)* RIGTH_OPENING_BRACE;
server_group : SPACE* server_left (op=SPACE fg_right)+ delimiter;
delimiter : SPACE*  S1_DELIMITER SPACE* ;


fg_right : (LOWER_STRING | STRING | STRING_WITH_OTHER | LOWER_STRING_WITH_UNDER_LINE)+;    //0个或多个字符串 | 一个或多个字符串 | 所有的字符串


user_left
        : USER
        | WORKER_PROCESSES
        | ERROR_LOG
        | WORKER_RLIMIT_NOFILE
        ;

events_left
        : USE
        | WORKER_CONNECTIONS
        ;

http_left
        : HTTP
        | INCLUDE
        | DEFAULT_TYPE
        | LOG_FORMAT
        | ACCESS_LOG
        | SERVER_NAMES_HASH_BUCKET_SIZE
        | SERVER_NAME_IN_REDIRECT
        | CLIENT_HEADER_BUFFER_SIZE
        | LARGE_CLIENT_HEADER_BUFFERS
        | SENDFILE
        | TCP_NOPUSH
        | KEEPALIVE_TIMEOUT
        | CLIENT_HEADER_TIMEOUT
        | CLIENT_BODY_TIMEOUT
        | SEND_TIMEOUT
        | GZIP
        | GZIP_MIN_LENGTH
        | GZIP_BUFFERS
        | GZIP_HTTP_VERSION
        | GZIP_COMP_LEVEL
        | GZIP_TYPES
        | GZIP_VARY
        | PROXY_REDIRECT
        | PROXY_SET_HEADER
        | CLIENT_MAX_BODY_SIZE
        | CLIENT_BODY_BUFFER_SIZE
        | PROXY_CONNECT_TIMEOUT
        | PROXY_SEND_TIMEOUT
        | PROXY_BUFFER_SIZE
        | PROXY_BUFFERS
        | PROXY_READ_TIMEOUT
        | PROXY_BUSY_BUFFERS_SIZE
        | PROXY_TEMP_FILE_WRITE_SIZE
        | PROXY_NEXT_UPSTREAM
        | PROXY_MAX_TEMP_FILE_SIZE
        | INDEX
        ;
server_left
        : LISTEN
        | SERVER_NAME
        | ROOT
        | DEFAULT_TYPE
        | ACCESS_LOG
        | AUTOINDEX
        | AUTOINDEX_LOCALTIME
        | CHARSET
        ;

