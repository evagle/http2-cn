A peer can limit the number of concurrently active streams using the SETTINGS_MAX_CONCURRENT_STREAMS parameter (see Section 6.5.2) within a SETTINGS frame. The maximum concurrent streams setting is specific to each endpoint and applies only to the peer that receives the setting. That is, clients specify the maximum number of concurrent streams the server can initiate, and servers specify the maximum number of concurrent streams the client can initiate.

端点可以通过使用SETTINGS帧的SETTINGS_MAX_CONCURRENT_STREAMS参数来限制活跃并发流的数量。最大并发流设置只对收到SETTINGS帧的端点生效，每个端点都拥有自己特定的并发数量限制。也就是说，客户端指定的最大并发数量限制了服务器可以初始化的最大流数量，而服务器指定的最大并发流数量则是对客户端生效。

Streams that are in the "open" state or in either of the "half-closed" states count toward the maximum number of streams that an endpoint is permitted to open. Streams in any of these three states count toward the limit advertised in the SETTINGS_MAX_CONCURRENT_STREAMS setting. Streams in either of the "reserved" states do not count toward the stream limit.

打开状态和本地半关闭、远程半关闭状态的流都计入端点的最大允许打开的流数量中。这三个状态的流都需要计入SETTINGS_MAX_CONCURRENT_STREAMS参数的限额中。预留状态的流不计入限额。

Endpoints MUST NOT exceed the limit set by their peer. An endpoint that receives a HEADERS frame that causes its advertised concurrent stream limit to be exceeded MUST treat this as a stream error (Section 5.4.2) of type PROTOCOL_ERROR or REFUSED_STREAM. The choice of error code determines whether the endpoint wishes to enable automatic retry (see Section 8.1.4) for details).

端点必须不能超过对方设置的并发限制。当端点收到一个HEADERS帧导致它超过了并发流限制，则必须处理成PROTOCOL_ERROR或REFUSED_STREAM类型的流程错误。错误类型的选择取决于端点是否希望允许自动重试。

An endpoint that wishes to reduce the value of SETTINGS_MAX_CONCURRENT_STREAMS to a value that is below the current number of open streams can either close streams that exceed the new value or allow streams to complete.

当一个端点希望将并发数量减少到当前已打开的流数量之下时，它可以选择关闭流来执行这个要求或者选择允许流完成它的剩余工作。


