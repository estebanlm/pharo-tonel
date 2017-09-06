"

"
Class {
	#name : #BecomeTest,
	#superclass : #TestCase,
	#category : #Tests-VM,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BecomeTest>>testBecome [
	"Test the two way become. Note. we cannot use string literals for this test"
	| a b c d |

	a := 'ab' copy.
	b := 'cd' copy.
	c := a.
	d := b.

	a become: b.

	self 
		assert: a = 'cd';
		assert: b = 'ab';
		assert: c = 'cd';
		assert: d = 'ab'.



]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BecomeTest>>testBecomeForward [
	"Test the forward become."
	| a b c d |

	a := 'ab' copy.
	b := 'cd' copy.
	c := a.
	d := b.

	a becomeForward: b.

	self 
		assert: a = 'cd';
		assert: b = 'cd';
		assert: c = 'cd';
		assert: d = 'cd'.



]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BecomeTest>>testBecomeForwardCopyIdentityHash [
	"Check that
		1. the argument to becomeForward: IS modified to have the sender's identity hash.
		2. the sender's identity hash is unchanged."

 	| a b identityHashOfA |

	a := 'ab' copy.
	b := 'cd' copy.
	identityHashOfA := a identityHash.

	a becomeForward: b copyHash: true.

	self 
		assert: a == b;
		assert: a identityHash = identityHashOfA;
		assert: b identityHash = identityHashOfA.


]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BecomeTest>>testBecomeForwardDontCopyIdentityHash [
	"Check that
		1. the argument to becomeForward: is NOT modified to have the receiver's identity hash.
		2. the receiver's identity hash is unchanged."

 	| a b identityHashOfB |

	a := 'ab' copy.
	b := 'cd' copy.
	identityHashOfB := b identityHash.

	a becomeForward: b copyHash: false.

	self 
		assert: a == b;
		assert: a identityHash = identityHashOfB;
		assert: b identityHash = identityHashOfB.


]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BecomeTest>>testBecomeForwardHash [

	| a b c hb |

	a := 'ab' copy.
	b := 'cd' copy.
	c := a.
	hb := b hash.

	a becomeForward: b.

	self 
		assert: a hash = hb;
		assert: b hash = hb;
		assert: c hash = hb.



]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BecomeTest>>testBecomeForwardIdentityHash [
	"Check that
		1. the argument to becomeForward: is modified to have the receiver's identity hash.
		2. the receiver's identity hash is unchanged."

 	| a b ha |

	a := 'ab' copy.
	b := 'cd' copy.
	ha := a identityHash.

	a becomeForward: b.

	self 
		assert: a identityHash = ha;
		assert: b identityHash = ha.


]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BecomeTest>>testBecomeHash [

	| a b c d ha hb |

	a := 'ab' copy.
	b := 'cd' copy.
	c := a.
	d := b.
	ha := a hash.
	hb := b hash.

	a become: b.

	self 
		assert: a hash = hb;
		assert: b hash = ha;
		assert: c hash = hb;
		assert: d hash = ha.



]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BecomeTest>>testBecomeIdentityHash [
	"Note. The identity hash of both objects seems to change after the become:"

	| a b c d |

	a := 'ab' copy.
	b := 'cd' copy.
	c := a.
	d := b.

	a become: b.

	self 
		assert: a identityHash = c identityHash;
		assert: b identityHash = d identityHash;
		deny: a identityHash = b identityHash.

]
