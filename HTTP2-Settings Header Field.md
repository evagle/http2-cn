A request that upgrades from HTTP/1.1 to HTTP/2 MUST include exactly one HTTP2-Settings header field. The HTTP2-Settings header field is a connection-specific header field that includes parameters that govern the HTTP/2 connection, provided in anticipation of the server accepting the request to upgrade.

	 HTTP2-Settings    = token68

升级HTTP/1.1到HTTP/2的升级请求必须有且只能有一个HTTP2-Settings报头字段。HTTP2-Settings报头字段是一个连接特定报头字段，它包含控制HTTP/2连接的参数，提供该参数期望服务器能够接受升级请求。
  
A server MUST NOT upgrade the connection to HTTP/2 if this header field is not present or if more than one is present. A server MUST NOT send this header field.

如果HTTP2-Settings报头字段没有提供或者提供了不止一个，服务器不应该升级连接到HTTP/2。另外，服务器不能发送这个报头字段。

The content of the HTTP2-Settings header field is the payload of a SETTINGS frame (Section 6.5), encoded as a base64url string (that is, the URL- and filename-safe Base64 encoding described in Section 5 of [RFC4648], with any trailing '=' characters omitted). The ABNF [RFC5234] production for token68 is defined in Section 2.1 of [RFC7235].

HTTP2-Settings报头字段的内容是SETTINGS帧的载体，被编码成base64url格式的字符串（即，[RFC4648]第五节中的对URL和文件名安全的Base64编码，忽略任何“=”字符）。ABNF[RFC5234]产品中对token68的定义在[RFC7235]2.1节中。

Since the upgrade is only intended to apply to the immediate connection, a client sending the HTTP2-Settings header field MUST also send HTTP2-Settings as a connection option in the Connection header field to prevent it from being forwarded (see Section 6.1 of [RFC7230]).

因为升级是对当前连接而言的，所以发送HTTP2-Settings报头字段的客户端也必须在Connection报头字段中发送字符串"HTTP2-Settings"来防止请求被转发。例如：

	 GET / HTTP/1.1
	 Host: server.example.com
	 Connection: Upgrade, HTTP2-Settings
	 Upgrade: h2c
	 HTTP2-Settings: <base64url encoding of HTTP/2 SETTINGS payload>

A server decodes and interprets these values as it would any other SETTINGS frame. Explicit acknowledgement of these settings (Section 6.5.3) is not necessary, since a 101 response serves as implicit acknowledgement. Providing these values in the upgrade request gives a client an opportunity to provide parameters prior to receiving any frames from the server.

服务器像对任何其他SETTINGS帧一样解码和解释这些值。因为101响应是作为一个隐式确认，所以对没有必要对这些设置进行显示确认。在升级请求中提供这些值赋予了客户端在收到任何来自服务器的帧之前提供这些参数的机会。


