The HTTP/2 specification is split into four parts:

+	Starting HTTP/2 (Section 3) covers how an HTTP/2 connection is initiated.
+	The framing (Section 4) and streams (Section 5) layers describe the way HTTP/2 frames are structured and formed into multiplexed streams.
+	Frame (Section 6) and error (Section 7) definitions include details of the frame and error types used in HTTP/2.
+	HTTP mappings (Section 8) and additional requirements (Section 9) describe how HTTP semantics are expressed using frames and streams.

HTTP/2规范分为一下四个部分：

+	启动HTTP/2包含了一个HTTP/2连接是如何初始化的。
+	分帧和流层描述了HTTP/2的帧是如何构成复用流的。
+	帧和错误定义包括了HTTP/2中使用的帧和错误类型的详细内容。
+	HTTP寻址和附加需求描述了如何用帧和流表达HTTP语义。

While some of the frame and stream layer concepts are isolated from HTTP, this specification does not define a completely generic framing layer. The framing and streams layers are tailored to the needs of the HTTP protocol and server push.

因为一些帧和流的概念是和HTTP分离的，这个规范没有定义一个完全通用的帧层。帧和流层是根据HTTP协议和服务器推送的需要定制的。