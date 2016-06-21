A client can assign a priority for a new stream by including prioritization information in the HEADERS frame (Section 6.2) that opens the stream. At any other time, the PRIORITY frame (Section 6.3) can be used to change the priority of a stream.

客户端可以通过在打开流的HEADERS帧包含优先级信息来赋予新流优先级。在任意时刻，都可以通过PRIORITY帧来改变流的优先级。

The purpose of prioritization is to allow an endpoint to express how it would prefer its peer to allocate resources when managing concurrent streams. Most importantly, priority can be used to select streams for transmitting frames when there is limited capacity for sending.

优先级的目的是允许端点表达它期望对方在管理并发的流时如何分配资源。更重要的是，优先级可以用来在发送容量受限的情况下决定哪些流可以发送数据。

Streams can be prioritized by marking them as dependent on the completion of other streams (Section 5.3.1). Each dependency is assigned a relative weight, a number that is used to determine the relative proportion of available resources that are assigned to streams dependent on the same stream.

流可以通过标记为依赖其他流的完成来设置优先级。每个依赖会分配一个相对的权重，这个权重决定依赖同一个流的所有流之间分配可用资源的比例。

Explicitly setting the priority for a stream is input to a prioritization process. It does not guarantee any particular processing or transmission order for the stream relative to any other stream. An endpoint cannot force a peer to process concurrent streams in a particular order using priority. Expressing priority is therefore only a suggestion.

给流明确的设置优先级会被输入到优先级处理过程中。这个过程不保证特殊的处理或者是改变流之间的相对处理顺序。端点不能通过优先级强迫对等端按指定的顺序处理并发的流。因此，指明优先级只是一个推荐。

Prioritization information can be omitted from messages. Defaults are used prior to any explicit values being provided (Section 5.3.5).

优先级信息可以从信息中删除。默认的优先级先于任何明确的优先级值。
