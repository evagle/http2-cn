HTTP/2提供了HTTP语义的传输优化。HTTP/2支持HTTP/1.1的所有核心特征，并且在很多方面做的更高效。

HTTP/2的基本协议单元是帧（第4章）。每个帧类型都有不同的目的和用途。例如，报头帧（HEADERS）和数据帧（DATA）组成了基本的HTTP请求和相应；其他的帧类型例如设置帧（SETTINGS）、窗口更新帧（WINDOW_UPDATE）、推送承诺帧（PUSH_PROMISE）被用来支持HTTP/2的其他特性。

请求多路复用是通过将HTTP请求-响应交换关联到一个流上来实现的。因为流相互之间是相互独立的，所以一个流上的请求或响应发生阻塞或停止不会影响其他流。


Flow control and prioritization ensure that it is possible to efficiently use multiplexed streams. Flow control (Section 5.2) helps to ensure that only data that can be used by a receiver is transmitted. Prioritization (Section 5.3) ensures that limited resources can be directed to the most important streams first.

流量控制和优先级保证了可以高效的使用的多路复用流。流量控制有助于保证只有可以被接受者使用的数据才会被传输。优先级使得最重要的流可以优先使用有限的资源。

HTTP/2 adds a new interaction mode, whereby a server can push responses to a client (Section 8.2). Server push allows a server to speculatively send data to a client that the server anticipates the client will need, trading off some network usage against a potential latency gain. The server does this by synthesizing a request, which it sends as a PUSH_PROMISE frame. The server is then able to send a response to the synthetic request on a separate stream.

HTTP/2添加了一种新的交互模式，这种交互模式中服务器可以向客户端推送响应。服务器推送允许服务器根据预测客户端可能需要的数据，主动向客户端发送数据，用一点网络的使用来交换潜在的时延降低。服务器通过合成一个通过PUSH_PROMISE帧发送的请求来实现推送。然后服务器就可以在一个单独的流里面响应这个合成请求。

Because HTTP header fields used in a connection can contain large amounts of redundant data, frames that contain them are compressed (Section 4.3). This has especially advantageous impact upon request sizes in the common case, allowing many requests to be compressed into one packet.

因为一个连接中的HTTP报头字段可能包含大量的冗余数据，所以包含报头字段的帧是被压缩的。通常情况下压缩能够极大地减少请求大小，从而实现将多个请求放入一个包里。
