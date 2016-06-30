Stream priorities are changed using the PRIORITY frame. Setting a dependency causes a stream to become dependent on the identified parent stream.

使用PRIORITY帧可以改变流的优先级。给一个流设置依赖使得这个流变成父类的依赖流。

Dependent streams move with their parent stream if the parent is reprioritized. Setting a dependency with the exclusive flag for a reprioritized stream causes all the dependencies of the new parent stream to become dependent on the reprioritized stream.

如果父流重设了优先级，那依赖流的优先级也随之改变。给重置优先级的流S设置依赖的时候带上排外标志会导致这个父流R的所有之前的依赖都变成S的依赖流。

If a stream is made dependent on one of its own dependencies, the formerly dependent stream is first moved to be dependent on the reprioritized stream's previous parent. The moved dependency retains its weight.

如果将一个流B设置依赖它本身的依赖流C（假设C依赖于B，B依赖于A），那么首先将依赖流C设置为B的父流C。被移动的依赖仍然保持之前的权重。

For example, consider an original dependency tree where B and C depend on A, D and E depend on C, and F depends on D. If A is made dependent on D, then D takes the place of A. All other dependency relationships stay the same, except for F, which becomes dependent on A if the reprioritization is exclusive.

	   x                x                x                 x
	   |               / \               |                 |
	   A              D   A              D                 D
	  / \            /   / \            / \                |
	 B   C     ==>  F   B   C   ==>    F   A       OR      A
	    / \                 |             / \             /|\
	   D   E                E            B   C           B C F
	   |                                     |             |
	   F                                     E             E
	              (intermediate)   (non-exclusive)    (exclusive)
Figure 5: Example of Dependency Reordering

例如，上图中，B、C依赖于A，D、E依赖于C，F依赖于D。如果需要让A依赖于D，那么先将D替代A的位置，使得D依赖于A的父流x，然后再让让A依赖于D，形成上图第3个依赖树的形状。如果设置了排外标志，那意味着只允许A依赖于D，之前依赖于D的流都需要下移依赖于A，形成上图第4个依赖树。