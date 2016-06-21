Flow control is defined to protect endpoints that are operating under resource constraints. For example, a proxy needs to share memory between many connections and also might have a slow upstream connection and a fast downstream one. Flow-control addresses cases where the receiver is unable to process data on one stream yet wants to continue to process other streams in the same connection.

流量控制是设计用来保护在有限资源限制的情况下运作的端点。例如，一个代理需要在很多连接之间共享内存，它可能有一个非常慢的上游和一个非常快的下游。流量控制解决如下情况下的问题：接收者没法处理某个流的数据但是它还想继续处理同一个连接中的其他流。

Deployments that do not require this capability can advertise a flow-control window of the maximum size (2^31-1) and can maintain this window by sending a WINDOW_UPDATE frame when any data is received. This effectively disables flow control for that receiver. Conversely, a sender is always subject to the flow-control window advertised by the receiver.

不需要使用流量控制的应用可以将控制窗口大小设置到最大，然后在收到数据后发送WINDOW_UPDATE帧来维持窗口大小。这样可以有效的禁止流量控制。相反的，发送者永远受到接收者流量控制窗口的控制。

Deployments with constrained resources (for example, memory) can employ flow control to limit the amount of memory a peer can consume. Note, however, that this can lead to suboptimal use of available network resources if flow control is enabled without knowledge of the bandwidth-delay product (see [RFC7323]).

资源（内存）受限的情况下可以使用流量控制来限制一个连接使用的内存量。然而需要注意，如果在不知道时延带宽积时使用流量控制将导致无法最大化利用网络资源。

Even with full awareness of the current bandwidth-delay product, implementation of flow control can be difficult. When using flow control, the receiver MUST read from the TCP receive buffer in a timely fashion. Failure to do so could lead to a deadlock when critical frames, such as WINDOW_UPDATE, are not read and acted upon.

即使对当前的时延带宽积非常清楚，实现流量控制也是非常困难的。当使用流量控制时，接收者必须即使的从TCP接收缓存中读取数据。如果一些关键的帧例如WINDOW_UPDATE帧没能及时读取和应用将会导致死锁。

