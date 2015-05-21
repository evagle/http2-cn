Stream priorities are changed using the PRIORITY frame. Setting a dependency causes a stream to become dependent on the identified parent stream.

Dependent streams move with their parent stream if the parent is reprioritized. Setting a dependency with the exclusive flag for a reprioritized stream causes all the dependencies of the new parent stream to become dependent on the reprioritized stream.

If a stream is made dependent on one of its own dependencies, the formerly dependent stream is first moved to be dependent on the reprioritized stream's previous parent. The moved dependency retains its weight.

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