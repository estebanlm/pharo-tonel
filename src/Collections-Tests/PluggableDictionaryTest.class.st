"
SUnit tests for pluggable dictionaries
"
Class {
	#name : #PluggableDictionaryTest,
	#superclass : #DictionaryTest,
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:21'
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableDictionaryTest class>>classToBeTested [

^ IdentitySet
]

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableDictionaryTest class>>shouldInheritSelectors [

^true
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableDictionaryTest>>classToBeTested [

^ PluggableDictionary
]

{
	#category : #'tests - copy - clone',
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableDictionaryTest>>testCopyEmpty [
	| pluggableDict copiedPluggableDict |

	super testCopyEmpty.

	(pluggableDict := self emptyDict)
		equalBlock: [:a :b | a = b];
		hashBlock: [:a | a hash].

	copiedPluggableDict := pluggableDict copyEmpty.
	self assert: copiedPluggableDict equalBlock == pluggableDict equalBlock.
	self assert: copiedPluggableDict hashBlock == pluggableDict hashBlock.
]

{
	#category : #'test - comparing',
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableDictionaryTest>>testEqualBlock [
	| pluggableDict assoc |

	pluggableDict := self emptyDict.
	self assert: pluggableDict equalBlock isNil.
	self assert: (pluggableDict equalBlock: [:a :b | a = b]) == pluggableDict.

	assoc := 'newKey' -> 'newValue'.
	pluggableDict add: assoc.
	self assert: (pluggableDict includesAssociation: assoc).

	pluggableDict equalBlock: [:a :b | a == b].
	self assert: (pluggableDict includesAssociation: assoc).
	pluggableDict
		removeKey: assoc key;
		add: assoc key copy -> assoc value.
	self deny: (pluggableDict includesAssociation: assoc).

	pluggableDict equalBlock: [:a :b | a = b].
	self assert: (pluggableDict includesAssociation: assoc).
]

{
	#category : #'test - comparing',
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableDictionaryTest>>testEqualBlockEquality [
	| pluggableDict pluggableDict2 equalBlock |

	pluggableDict := self nonEmptyDict.
	pluggableDict2 := self nonEmptyDict copy.

	equalBlock := [:a :b | a = b].
	pluggableDict2 equalBlock: equalBlock.
	self deny: pluggableDict = pluggableDict2.
	self deny: pluggableDict2 = pluggableDict.

	pluggableDict equalBlock: equalBlock.
	self assert: pluggableDict = pluggableDict2.
	self assert: pluggableDict2 = pluggableDict.
]

{
	#category : #'test - comparing',
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableDictionaryTest>>testHashBlock [
	| pluggableDict keys |

	pluggableDict := self nonEmptyDict.
	keys := pluggableDict keys.
	self assert: pluggableDict hashBlock isNil.
	self assert: (pluggableDict hashBlock: [:a | a hash]) == pluggableDict.

	keys do: [:each | self assert: (pluggableDict includesKey: each)].
	self deny: (pluggableDict includesKey: self keyNotIn).
]

{
	#category : #'test - comparing',
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableDictionaryTest>>testHashBlockEquality [
	| pluggableDict pluggableDict2 hashBlock |

	pluggableDict := self nonEmptyDict.
	pluggableDict2 := self nonEmptyDict copy.

	hashBlock := [:a | a hash].
	pluggableDict2 hashBlock: hashBlock.
	self deny: pluggableDict = pluggableDict2.
	self deny: pluggableDict2 = pluggableDict.

	pluggableDict hashBlock: hashBlock.
	self assert: pluggableDict = pluggableDict2.
	self assert: pluggableDict2 = pluggableDict.
]
