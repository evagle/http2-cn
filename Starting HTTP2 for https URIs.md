A client that makes a request to an "https" URI uses TLS [TLS12] with the application-layer protocol negotiation (ALPN) extension [TLS-ALPN].

客户端利用TLS和应用层协议协商扩展构建https请求。

HTTP/2 over TLS uses the "h2" protocol identifier. The "h2c" protocol identifier MUST NOT be sent by a client or selected by a server; the "h2c" protocol identifier describes a protocol that does not use TLS.

基于TLS的HTTP/2使用“h2”作为协议标识符。“h2c”协议标识符不能被客户端不能发送或者被服务器选择；“h2c”协议标识符表示该协议不使用TLS。

Once TLS negotiation is complete, both the client and the server MUST send a connection preface (Section 3.5).

当TLS协商完成后，客户端和服务器端都必须发送一个连接前言。

