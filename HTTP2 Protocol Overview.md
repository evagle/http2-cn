HTTP/2提供了HTTP语义的传输优化。HTTP/2支持HTTP/1.1的所有核心特征，并且在很多方面做的更高效。

HTTP/2的基本协议单元是帧（第4章）。每个帧类型都有不同的目的和用途。例如，报头帧（HEADERS）和数据帧（DATA）组成了基本的HTTP请求和相应；其他的帧类型例如设置帧（SETTINGS）、窗口更新帧（WINDOW_UPDATE）、推送承诺帧（PUSH_PROMISE）被用来支持HTTP/2的其他特性。

请求的多路复用

Multiplexing of requests is achieved by having each HTTP request-response exchange associated with its own stream (Section 5). Streams are largely independent of each other, so a blocked or stalled request or response does not prevent progress on other streams.

Flow control and prioritization ensure that it is possible to efficiently use multiplexed streams. Flow control (Section 5.2) helps to ensure that only data that can be used by a receiver is transmitted. Prioritization (Section 5.3) ensures that limited resources can be directed to the most important streams first.

HTTP/2 adds a new interaction mode, whereby a server can push responses to a client (Section 8.2). Server push allows a server to speculatively send data to a client that the server anticipates the client will need, trading off some network usage against a potential latency gain. The server does this by synthesizing a request, which it sends as a PUSH_PROMISE frame. The server is then able to send a response to the synthetic request on a separate stream.

Because HTTP header fields used in a connection can contain large amounts of redundant data, frames that contain them are compressed (Section 4.3). This has especially advantageous impact upon request sizes in the common case, allowing many requests to be compressed into one packet.

