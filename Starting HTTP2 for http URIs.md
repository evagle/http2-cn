A client that makes a request for an "http" URI without prior knowledge about support for HTTP/2 on the next hop uses the HTTP Upgrade mechanism (Section 6.7 of [RFC7230]). The client does so by making an HTTP/1.1 request that includes an Upgrade header field with the "h2c" token. Such an HTTP/1.1 request MUST include exactly one HTTP2-Settings (Section 3.2.1) header field.

For example:

	 GET / HTTP/1.1
	 Host: server.example.com
	 Connection: Upgrade, HTTP2-Settings
	 Upgrade: h2c
	 HTTP2-Settings: <base64url encoding of HTTP/2 SETTINGS payload>

在不知道下一跳是否支持HTTP/2的情况下，客户端使用HTTP升级机制来向“http” URI发送请求（[RFC7230]6.7节）。客户端构造一个升级报头字段值为"h2c"的请求来做到这一点。这样的HTTP/1.1请求必须且只能包含一个HTTP2-Settings头部字段。

例如：

	 GET / HTTP/1.1
	 Host: server.example.com
	 Connection: Upgrade, HTTP2-Settings
	 Upgrade: h2c
	 HTTP2-Settings: <base64url encoding of HTTP/2 SETTINGS payload>
 
Requests that contain a payload body MUST be sent in their entirety before the client can send HTTP/2 frames. This means that a large request can block the use of the connection until it is completely sent.

客户端必须在全部发送完包含主体内容的请求之后才能发送HTTP/2帧。这意味着一个大的请求在完全发送完之前可以阻塞连接。

If concurrency of an initial request with subsequent requests is important, an OPTIONS request can be used to perform the upgrade to HTTP/2, at the cost of an additional round trip.

如果一个初始请求后的后续请求的并发性很重要，则可以用一个额外的请求将协议来升级到HTTP/2，代价是多一个来回的时间。

A server that does not support HTTP/2 can respond to the request as though the Upgrade header field were absent:

	HTTP/1.1 200 OK
	Content-Length: 243
	Content-Type: text/html
	
	...
 
不支持HTTP/2的服务器也可以回复升级请求，只不过响应不包括升级报头字段，例子：

	HTTP/1.1 200 OK
	Content-Length: 243
	Content-Type: text/html
	
	...

A server MUST ignore an "h2" token in an Upgrade header field. Presence of a token with "h2" implies HTTP/2 over TLS, which is instead negotiated as described in Section 3.3.

服务器必须忽略升级报头中的"h2"。"h2"的存在意味着这是基于TLS实现的HTTP/2，这部分内容将在3.3节讨论。

A server that supports HTTP/2 accepts the upgrade with a 101 (Switching Protocols) response. After the empty line that terminates the 101 response, the server can begin sending HTTP/2 frames. These frames MUST include a response to the request that initiated the upgrade.

For example:

	HTTP/1.1 101 Switching Protocols
	Connection: Upgrade
	Upgrade: h2c
  
	[ HTTP/2 connection ...
  
一个支持HTTP/2的服务器接受升级请求并返回响应101（切换协议）。在发送空行表示101响应结束后，服务器就可以开始发送HTTP/2帧了。这些帧必须包含对发起升级的请求的响应。

例如：

	HTTP/1.1 101 Switching Protocols
	Connection: Upgrade
	Upgrade: h2c
  
	[ HTTP/2 connection ...
  
The first HTTP/2 frame sent by the server MUST be a server connection preface (Section 3.5) consisting of a SETTINGS frame (Section 6.5). Upon receiving the 101 response, the client MUST send a connection preface (Section 3.5), which includes a SETTINGS frame.

服务器发送的第一个HTTP/2帧必须是包含一个SETTINGS帧的服务器连接前言（3.5节）。一旦收到101响应，客户端也必须发送一个包含SETTINGS帧的连接前言。

The HTTP/1.1 request that is sent prior to upgrade is assigned a stream identifier of 1 (see Section 5.1.1) with default priority values (Section 5.3.5). Stream 1 is implicitly "half-closed" from the client toward the server (see Section 5.1), since the request is completed as an HTTP/1.1 request. After commencing the HTTP/2 connection, stream 1 is used for the response.

在升级之前发送的HTTP/1.1的请求被分配一个标示为1的流并赋予默认优先级。流1是从客户端到服务器是隐式半封闭的，因为这个请求是按照HTTP/1.1协议请求完成的。在HTTP/2连接完成后，流1将被用来发送响应。


