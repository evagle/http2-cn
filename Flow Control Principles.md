HTTP/2 stream flow control aims to allow a variety of flow-control algorithms to be used without requiring protocol changes. Flow control in HTTP/2 has the following characteristics:

HTTP/2的流量控制目的在于实现在不改变协议的前提下允许使用多种流量控制算法。HTTP/2的流量控制拥有以下的特征。

1.	Flow control is specific to a connection. Both types of flow control are between the endpoints of a single hop and not over the entire end-to-end path.
2.	Flow control is based on WINDOW_UPDATE frames. Receivers advertise how many octets they are prepared to receive on a stream and for the entire connection. This is a credit-based scheme.
3.	Flow control is directional with overall control provided by the receiver. A receiver MAY choose to set any window size that it desires for each stream and for the entire connection. A sender MUST respect flow-control limits imposed by a receiver. Clients, servers, and intermediaries all independently advertise their flow-control window as a receiver and abide by the flow-control limits set by their peer when sending.
4.	The initial value for the flow-control window is 65,535 octets for both new streams and the overall connection.
5.	The frame type determines whether flow control applies to a frame. Of the frames specified in this document, only DATA frames are subject to flow control; all other frame types do not consume space in the advertised flow-control window. This ensures that important control frames are not blocked by flow control.
6.	Flow control cannot be disabled.
7.	HTTP/2 defines only the format and semantics of the WINDOW_UPDATE frame (Section 6.9). This document does not stipulate how a receiver decides when to send this frame or the value that it sends, nor does it specify how a sender chooses to send packets. Implementations are able to select any algorithm that suits their needs.
       
Implementations are also responsible for managing how requests and responses are sent based on priority, choosing how to avoid head-of-line blocking for requests, and managing the creation of new streams. Algorithm choices for these could interact with any flow-control algorithm.

1.   流量控制是特定于连接的。两种类型的流量控制都是基于网路中相邻的两个端点间，而不是整个端到端的路径。
2.   流量控制基于WINDOW_UPDATE帧。接收者广播它在一个流和整个连接中准备接收多少字节。这是一个基于信用的方案。
3.   流量控制是由接收器提供的有方向性的全面控制。发送方必须尊重由接收方设置的流量控制范围。客户端、服务器和路由器等都独立的广播他们作为接收者的流量控制窗口与此同时准守他们的接收者所设定的流量控制窗口限制。
4.   新流和新连接的初始的流量控制窗口大小都是65535字节。
5.   帧类型决定了流量控制是否适用于这个帧。在这个文档中指定的帧，只有数据帧受到流量控制的约束；其他类型的帧都不会消耗流量控制窗口的空间。这保证了重要的控制帧不会被流量控制阻塞。
6.   流量控制不能被禁止。
7.   HTTP/2仅仅定义了WINDOW_UPDATE帧的格式和含义。文档并没有规定接收者如何决定何时到那个这个帧以及这个帧发送的值，也没有规定发送者选择怎样发送包。实现者可以选择合适自己的任何算法。

负责管理如何基于优先级管理请求和响应发送、选择如何避免请求的排头阻塞以及管理新流的创建。这些算法的选择需要能够和所有流量控制算法交互。接收者可以为每个流和整个连接设置它所期望的任何窗口大小。



