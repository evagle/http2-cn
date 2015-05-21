A "stream" is an independent, bidirectional sequence of frames exchanged between the client and server within an HTTP/2 connection. Streams have several important characteristics:

+	A single HTTP/2 connection can contain multiple concurrently open streams, with either endpoint interleaving frames from multiple streams.
+	Streams can be established and used unilaterally or shared by either the client or server.
+	Streams can be closed by either endpoint.
+	The order in which frames are sent on a stream is significant. Recipients process frames in the order they are received. In particular, the order of HEADERS and DATA frames is semantically significant.
+	Streams are identified by an integer. Stream identifiers are assigned to streams by the endpoint initiating the stream.
