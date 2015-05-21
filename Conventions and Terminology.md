The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119 [RFC2119].

文档中出现的关键字“必须”,“绝对不能”，“要求”，“应”，“不应”，“应该”，“不应该”，“建议”，“可以”及“可选”可通过在 RFC 2119 的解释进行理解【RFC2119】

All numeric values are in network byte order. Values are unsigned unless otherwise indicated. Literal values are provided in decimal or hexadecimal as appropriate. Hexadecimal literals are prefixed with 0x to distinguish them from decimal literals.

所有的数值都是按网络字节顺序。除非有另外说明，数值是无符号的。按情况提供十进制或十六进制的文本值。十六进制用前缀0x来区分。

The following terms are used:

+	**client**:
The endpoint that initiates an HTTP/2 connection. Clients send HTTP requests and receive HTTP responses.

+	**connection:**
A transport-layer connection between two endpoints.

+	**connection error:**
An error that affects the entire HTTP/2 connection.

+	**endpoint:**
Either the client or server of the connection.

+	**frame:**
The smallest unit of communication within an HTTP/2 connection, consisting of a header and a variable-length sequence of octets structured according to the frame type.

+	**peer:**
An endpoint. When discussing a particular endpoint, "peer" refers to the endpoint that is remote to the primary subject of discussion.

+	**receiver:**
An endpoint that is receiving frames.

+	**sender:**
An endpoint that is transmitting frames.

+	**server:**
The endpoint that accepts an HTTP/2 connection. Servers receive HTTP requests and serve HTTP responses.

+	**stream:**
A bi-directional flow of frames within the HTTP/2 connection.

+	**stream error:**
An error on the individual HTTP/2 stream.

文中使用到的术语包括：

+	**客户端**：发起HTTP/2请求的端点。客户端发送请求接受响应。
+	**连接**：在两个端点之间的传输层级别的连接。
+	**连接错误**：影响整个HTTP/2连接的错误。
+	**端点**：连接的客户端或服务器。
+	**帧**：HTTP/2.0通信连接中的最小单元，包括根据帧类型结构的字节的报头和可变长度 的序列。
+	**对等端**：一个端点。当讨论特定的端点时，“对等端”指的是讨论的主题的远程端点。
+	**接收端**：正在接收帧的端点。
+	**发送端**：正在传输帧的端点。
+	**服务端**：接受HTTP/2连接的端点。服务器接受请求发送响应。
+	**流**：HTTP/2连接中的一个双向字节帧流。
+	**流错误**：一个HTTP/2流中的错误

Finally, the terms "gateway", "intermediary", "proxy", and "tunnel" are defined in Section 2.3 of [RFC7230]. Intermediaries act as both client and server at different times.

The term "payload body" is defined in Section 3.3 of [RFC7230].

最后，文档[RFC7230]2.3节给出了术语“网关”、“中间层”、“代理”和“隧道”的定义。中间层在不同时间可以既做客户端又可以做服务器。

文档[RFC7230]3.3节给出了术语“载体”的定义。

