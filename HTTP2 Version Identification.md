The protocol defined in this document has two identifiers.

+	The string "h2" identifies the protocol where HTTP/2 uses Transport Layer Security (TLS) [TLS12]. This identifier is used in the TLS application-layer protocol negotiation (ALPN) extension [TLS-ALPN] field and in any place where HTTP/2 over TLS is identified. 

	The "h2" string is serialized into an ALPN protocol identifier as the two-octet sequence: 0x68, 0x32.
	
+	The string "h2c" identifies the protocol where HTTP/2 is run over cleartext TCP. This identifier is used in the HTTP/1.1 Upgrade header field and in any place where HTTP/2 over TCP is identified. 

	The "h2c" string is reserved from the ALPN identifier space but describes a protocol that does not use TLS.

Negotiating "h2" or "h2c" implies the use of the transport, security, framing, and message semantics described in this document.


本文定义的协议有两个标示符。

+	字符串"h2"表示HTTP/2协议使用TLS[TLS12]。这个标示符用在TLS-ALPN字段中和任何基于TLS的HTTP/2协议中。
	
	字符串"h2"以两个十六进制序列：0x86, 0x32形式序列化到ALPN协议标示符中。
+	字符串"h2c"表示HTTP/2协议运行在明文TCP上。这个标示符用在HTTP/1.1升级报头字段中以及任何基于TCP的HTTP/2协议中。

	"h2c"是从ALPN标示符中保留下来的，但是它描述的是不适用TLS的协议。
	
讨论"h2"或者"h2c"意味着使用本文描述的传输、安全、帧和消息语义。
	