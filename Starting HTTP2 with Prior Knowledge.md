A client can learn that a particular server supports HTTP/2 by other means. For example, [ALT-SVC] describes a mechanism for advertising this capability.

客户端可以通过其他方式获得特定服务器是否支持HTTP/2。例如，[ALT-SVC]就描述了一种机制来广播这种能力（支持HTTP/2）。

A client MUST send the connection preface (Section 3.5) and then MAY immediately send HTTP/2 frames to such a server; servers can identify these connections by the presence of the connection preface. This only affects the establishment of HTTP/2 connections over cleartext TCP; implementations that support HTTP/2 over TLS MUST use protocol negotiation in TLS [TLS-ALPN].

客户端必须向服务器发送连接前言，同时可以立即发送HTTP/2序列帧；服务器根据连接前言鉴别这些连接。这只对基于明文TCP协议的HTTP/2连接有效；基于TLS的HTTP/2连接必须使用TLS的协议协商。

Likewise, the server MUST send a connection preface (Section 3.5).

类似的，服务器也必须发送一个连接前言。

Without additional information, prior support for HTTP/2 is not a strong signal that a given server will support HTTP/2 for future connections. For example, it is possible for server configurations to change, for configurations to differ between instances in clustered servers, or for network conditions to change.

没有额外的信息的情况下，之前对HTTP/2的支持并不能表明这个服务器在未来的连接中也支持HTTP/2。例如，可能服务器配置发生了变化，可能集群服务器的配置各不相同，或者网络环境发生了改变。
