Using streams for multiplexing introduces contention over use of the TCP connection, resulting in blocked streams. A flow-control scheme ensures that streams on the same connection do not destructively interfere with each other. Flow control is used for both individual streams and for the connection as a whole.

HTTP/2 provides for flow control through use of the WINDOW_UPDATE frame (Section 6.9).

使用流的多路复用会引发对TCP连接的过度使用，最终导致流被阻塞。流量控制机制保障同一个连接的流之间不会相互产生破坏性的影响。流量控制既用于单独的流也用户整个连接。

HTTP/2使用WINDOW_UPDATE帧来提供流量控制服务。