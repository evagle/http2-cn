In HTTP/2, each endpoint is required to send a connection preface as a final confirmation of the protocol in use and to establish the initial settings for the HTTP/2 connection. The client and server each send a different connection preface.

在HTTP/2协议中，每个端都需要发送一个连接前言作为对协议使用的最终确认并确定HTTTP/2连接的初始设置参数。

The client connection preface starts with a sequence of 24 octets, which in hex notation is:

	 0x505249202a20485454502f322e300d0a0d0a534d0d0a0d0a
  
客户端连接前言是以24字节的序列开始的，以十六进制表示是:

	 0x505249202a20485454502f322e300d0a0d0a534d0d0a0d0a
  
That is, the connection preface starts with the string PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n). This sequence MUST be followed by a SETTINGS frame (Section 6.5), which MAY be empty. The client sends the client connection preface immediately upon receipt of a 101 (Switching Protocols) response (indicating a successful upgrade) or as the first application data octets of a TLS connection. If starting an HTTP/2 connection with prior knowledge of server support for the protocol, the client connection preface is sent upon connection establishment.

即，这个连接前言以字符串 PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n 开始。这个序列后必须紧跟着一个SETTINGS帧，不过SETTINGS帧可以为空。一旦客户端收到101（协议转换）响应（表示协议升级成功）就立即发送连接前言，或者作为TLS连接的第一个应用层数据字节。如果事先知道服务器支持HTTP/2的情况下启动一个HTTP/2连接，则客户端连接前言在连接建立后发送。

+	Note: The client connection preface is selected so that a large proportion of HTTP/1.1 or HTTP/1.0 servers and intermediaries do not attempt to process further frames. Note that this does not address the concerns raised in [TALKING].

+	注意：客户端连接前言的存在是为了让很大比例的HTTP/1.1和HTTP/1.0协议的服务器或中间节点不试图去处理接下来的帧数据。注意这并没有解决[讨论]中提出的问题。

The server connection preface consists of a potentially empty SETTINGS frame (Section 6.5) that MUST be the first frame the server sends in the HTTP/2 connection.

服务器连接前言包含一个可能为空的SETTINGS帧，它必须是HTTP/2连接中服务器发送的第一个帧。

The SETTINGS frames received from a peer as part of the connection preface MUST be acknowledged (see Section 6.5.3) after sending the connection preface.

从另一方收到的连接前言中的SETTINGS帧必须在发送连接前言后进行确认。（例如客户端收到服务器连接前言中的SETTINGS帧，则必须在发送客户端连接前言后对这个SETTINGS帧进行确认）

To avoid unnecessary latency, clients are permitted to send additional frames to the server immediately after sending the client connection preface, without waiting to receive the server connection preface. It is important to note, however, that the server connection preface SETTINGS frame might include parameters that necessarily alter how a client is expected to communicate with the server. Upon receiving the SETTINGS frame, the client is expected to honor any parameters established. In some configurations, it is possible for the server to transmit SETTINGS before the client sends additional frames, providing an opportunity to avoid this issue.

为了减少不必要的时延，允许客户端发送客户端连接前言时同时发送额外的帧，而不用等收到服务器连接前言后再发送。然而，必须注意到：服务器连接前言的SETTINS帧可能包含规定客户端如何与服务器通信的参数。一旦收到SETTINGS帧，客户端就应当遵守这些参数的设定。在某些配置下，服务器可以在客户端发送额外的帧之前发送SETTINGS帧，从而避免上面的问题。

Clients and servers MUST treat an invalid connection preface as a connection error (Section 5.4.1) of type PROTOCOL_ERROR. A GOAWAY frame (Section 6.8) MAY be omitted in this case, since an invalid preface indicates that the peer is not using HTTP/2.

服务器和客户端必须将错误的连接前言看作是PROTOCOL_ERROR类型的连接错误。在这种情况下，GOAWAY帧可以忽略，因为一个非法的连接前言意味着连接并非使用HTTP/2。
