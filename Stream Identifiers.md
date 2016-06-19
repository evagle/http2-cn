Streams are identified with an unsigned 31-bit integer. Streams initiated by a client MUST use odd-numbered stream identifiers; those initiated by the server MUST use even-numbered stream identifiers. A stream identifier of zero (0x0) is used for connection control messages; the stream identifier of zero cannot be used to establish a new stream.

流依靠一个32位无符号整数来作为ID标识。客户端初始化的流必须是奇数的ID，服务器初始化的流必须是偶数的ID。ID为0的流是用来传递连接控制消息的，0不能用来建立一个新的流。

HTTP/1.1 requests that are upgraded to HTTP/2 (see Section 3.2) are responded to with a stream identifier of one (0x1). After the upgrade completes, stream 0x1 is "half-closed (local)" to the client. Therefore, stream 0x1 cannot be selected as a new stream identifier by a client that upgrades from HTTP/1.1.

从HTTP/1.1升级到HTTP/2的请求使用ID为1的流来响应。在升级完成后，ID为1的流对于客户端来时变为“本地半关闭”状态。所以从协议HTTP/1.1升级的客户端不能使用1作为流ID。

The identifier of a newly established stream MUST be numerically greater than all streams that the initiating endpoint has opened or reserved. This governs streams that are opened using a HEADERS frame and streams that are reserved using PUSH_PROMISE. An endpoint that receives an unexpected stream identifier MUST respond with a connection error (Section 5.4.1) of type PROTOCOL_ERROR.

新建立的流的ID必须大于所有打开或预留的流ID。使用HEADERS帧而在打开状态的流和因为PUSH_PROMISE而处于预留状态的流都符合这个规则。如果端点收到不符合条件的流ID，必须返回连接错误。

The first use of a new stream identifier implicitly closes all streams in the "idle" state that might have been initiated by that peer with a lower-valued stream identifier. For example, if a client sends a HEADERS frame on stream 7 without ever sending a frame on stream 5, then stream 5 transitions to the "closed" state when the first frame for stream 7 is sent or received.

第一次使用一个新的流ID会隐式的关闭所有小于这个流ID的所有空闲状态的流。例如，如果ID为5的流没有发送或接收任何帧的情况下，客户端在ID为7的流上发送一个HEADERS帧，那ID为5的流就会变为关闭状态。

Stream identifiers cannot be reused. Long-lived connections can result in an endpoint exhausting the available range of stream identifiers. A client that is unable to establish a new stream identifier can establish a new connection for new streams. A server that is unable to establish a new stream identifier can send a GOAWAY frame so that the client is forced to open a new connection for new streams.

流ID不能重复使用。长连接可能导致端点用完所有可用的流ID。当客户端无法建立一个新的流ID时可以通过建立一个新的连接来创建新的流。如果服务器无法建立新的流ID时可以发送GOAWAY帧给客户端来强制客户端开一个新的连接。

