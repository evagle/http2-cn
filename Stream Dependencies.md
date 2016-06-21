Each stream can be given an explicit dependency on another stream. Including a dependency expresses a preference to allocate resources to the identified stream rather than to the dependent stream.

每个流都可以明确地依赖另一个流。包含一个依赖表示倾向于分配更多的资源给被依赖的流而不是依赖其他流的流。

A stream that is not dependent on any other stream is given a stream dependency of 0x0. In other words, the non-existent stream 0 forms the root of the tree.

一个没有依赖任何流的流会被赋予0作为依赖。换句话说，不存在的流0形成了依赖树的更节点。

A stream that depends on another stream is a dependent stream. The stream upon which a stream is dependent is a parent stream. A dependency on a stream that is not currently in the tree -- such as a stream in the "idle" state -- results in that stream being given a default priority (Section 5.3.5).

遗留依赖于其他流的流叫做依赖流。被依赖的流叫做父流。依赖当前不在依赖树中的流会导致这个被依赖的流被赋予一个默认优先级（例如依赖一个空闲状态的流）。

When assigning a dependency on another stream, the stream is added as a new dependency of the parent stream. Dependent streams that share the same parent are not ordered with respect to each other. For example, if streams B and C are dependent on stream A, and if stream D is created with a dependency on stream A, this results in a dependency order of A followed by B, C, and D in any order.

当分配一个依赖时，这个流被加到父流的依赖树中。拥有共同父节点的依赖流是没有固定顺序的。例如，B和C依赖于A，当D也创建一个依赖依赖于A后，B、C和D的顺序完全是随机的，可以是任何顺序。

	   A                 A
	  / \      ==>      /|\
	 B   C             B D C
Figure 3: Example of Default Dependency Creation

An exclusive flag allows for the insertion of a new level of dependencies. The exclusive flag causes the stream to become the sole dependency of its parent stream, causing other dependencies to become dependent on the exclusive stream. In the previous example, if stream D is created with an exclusive dependency on stream A, this results in D becoming the dependency parent of B and C.

排外标志允许插入一个新级别的依赖。排外标志导致这个流变成父流唯一的依赖流，而其他的依赖流则会成为它的子流。在上面的例子中，如果D创建一个排外依赖依赖于A，则D将成为B和C的父流。
	
	                     A
	   A                 |
	  / \      ==>       D
	 B   C              / \
	                   B   C
Figure 4: Example of Exclusive Dependency Creation

Inside the dependency tree, a dependent stream SHOULD only be allocated resources if either all of the streams that it depends on (the chain of parent streams up to 0x0) are closed or it is not possible to make progress on them.

在依赖树里面，依赖流仅可以在所有它所有的父流都关闭了或者不能操作的时候才能分配到资源。

A stream cannot depend on itself. An endpoint MUST treat this as a stream error (Section 5.4.2) of type PROTOCOL_ERROR.

流不能依赖自己。端点必须将依赖自己视为流错误。
