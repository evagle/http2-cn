A "stream" is an independent, bidirectional sequence of frames exchanged between the client and server within an HTTP/2 connection. Streams have several important characteristics:

+	A single HTTP/2 connection can contain multiple concurrently open streams, with either endpoint interleaving frames from multiple streams.
+	Streams can be established and used unilaterally or shared by either the client or server.
+	Streams can be closed by either endpoint.
+	The order in which frames are sent on a stream is significant. Recipients process frames in the order they are received. In particular, the order of HEADERS and DATA frames is semantically significant.
+	Streams are identified by an integer. Stream identifiers are assigned to streams by the endpoint initiating the stream.

流是服务器和客户端在HTTP/2连接里进行交换的一个独立、双工的帧序列。流具有若干重要特征：

+  一个单独的HTTP/2连接可以包含多个并发的流，任何一个端都可以同时处理来自多个流的交错帧。
+  流可以被客户端或者服务器单独建立和使用。
+  流可以被任何一端关闭。
+  流中的帧的发送顺序是非常重要的。接收者按照帧的接受顺序来处理帧。特别地，DATA和HEADERS帧的顺序是语义上有意义的。
+  流依靠一个整数进行标识。流标识由初始化流的端赋予。