Just as in HTTP/1, a header field in HTTP/2 is a name with one or more associated values. Header fields are used within HTTP request and response messages as well as in server push operations (see Section 8.2).

和HTTP/1一样，HTTP/2中的头部也是一个名字关联着一个或多个值。头部字段被使用在HTTP请求和响应，以及服务器推送操作中。

Header lists are collections of zero or more header fields. When transmitted over a connection, a header list is serialized into a header block using HTTP header compression [COMPRESSION]. The serialized header block is then divided into one or more octet sequences, called header block fragments, and transmitted within the payload of HEADERS (Section 6.2), PUSH_PROMISE (Section 6.6), or CONTINUATION (Section 6.10) frames.

头部列表是0个或多个头部字段的集合。在传输的时候，头部列表使用HTTP头部压缩算法序列化到头部块。然后序列化的头部块被切分成一个或多个字节序列，称为头部块帧，然后作为HEADERS、PUSH_PROMISE或CONTINUATION帧的负载传输。

The Cookie header field [COOKIE] is treated specially by the HTTP mapping (see Section 8.1.2.5).

Cookie报头字段被HTTP映射特殊处理。

A receiving endpoint reassembles the header block by concatenating its fragments and then decompresses the block to reconstruct the header list.

接收端通过串联帧片段来重新组合头部块，然后解压头部块重构头部列表。

A complete header block consists of either:

+	a single HEADERS or PUSH_PROMISE frame, with the END_HEADERS flag set, or
+	a HEADERS or PUSH_PROMISE frame with the END_HEADERS flag cleared and one or more CONTINUATION frames, where the last CONTINUATION frame has the END_HEADERS flag set.

一个完整的头部包括了：
+  一个单独的设置了END_HEADERS标识的HEADERS帧或PUSH_PROMISE帧，或者
+  一个没有设置END_HEADERS标识的HEADERS帧或PUSH_PROMISE帧加上一个或多个CONTINUATION帧，并且最后一个CONTINUATION帧设置了END_HEADERS标识。

Header compression is stateful. One compression context and one decompression context are used for the entire connection. A decoding error in a header block MUST be treated as a connection error (Section 5.4.1) of type COMPRESSION_ERROR.

头部压缩是有状态的。整个连接都必须一致使用压缩或者一致不使用压缩。头部的解码错误必须按照COMPRESSION_ERROR类型的连接错误来处理。

Each header block is processed as a discrete unit. Header blocks MUST be transmitted as a contiguous sequence of frames, with no interleaved frames of any other type or from any other stream. The last frame in a sequence of HEADERS or CONTINUATION frames has the END_HEADERS flag set. The last frame in a sequence of PUSH_PROMISE or CONTINUATION frames has the END_HEADERS flag set. This allows a header block to be logically equivalent to a single frame.

每个头部块是离散处理的。头部可必须按照连续的序列帧来传送，中间不能夹杂任何其他流的或者其他类型的帧。HEADERS和CONTINUATION帧序列中最一个必须设置了END_HEADERS标识。PUSH_PROMISE和CONTINUATION帧序列中最一个也必须设置了END_HEADERS标识。这样使得头部块逻辑等同于一个帧。

Header block fragments can only be sent as the payload of HEADERS, PUSH_PROMISE, or CONTINUATION frames because these frames carry data that can modify the compression context maintained by a receiver. An endpoint receiving HEADERS, PUSH_PROMISE, or CONTINUATION frames needs to reassemble header blocks and perform decompression even if the frames are to be discarded. A receiver MUST terminate the connection with a connection error (Section 5.4.1) of type COMPRESSION_ERROR if it does not decompress a header block.

头部分片只能由HEADERS，PUSH_PROMISE或CONTINUATION的载体中携带，因为这些帧可以修改接收者的压缩环境设置。一个端收到HEADERS，PUSH_PROMISE或CONTINUATION帧后，需要重组头部块并解压缩，即使这些帧最终被废弃。如果接收者无法解压缩头部，那么必须报COMPRESSION_ERROR类型的连接错误并终止连接。

