All dependent streams are allocated an integer weight between 1 and 256 (inclusive).

所有的依赖流都会分配一个1到256之间的整数作为权重。

Streams with the same parent SHOULD be allocated resources proportionally based on their weight. Thus, if stream B depends on stream A with weight 4, stream C depends on stream A with weight 12, and no progress can be made on stream A, stream B ideally receives one-third of the resources allocated to stream C.

拥有相同父流的流依据它们的权重比例来分配资源。一次，如果B和C都依赖于A，B的权重为4，C的权重为12，当流A不能操作时，B获得的资源是C的1/3。