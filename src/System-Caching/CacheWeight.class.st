"
I  am CacheWeight.
I keep track of the weight of a cache.

The weight of a cache is the sum of the weight of all values currently present. The simplest and default weight calculation returns a constant 1 for each value, effectively counting the number of values.

The default maximum is 16.

Using compute, a selector or block, applied to a value, different calculation can be made. Consider for example #sizeInMemory.
"
Class {
	#name : #CacheWeight,
	#superclass : #Object,
	#instVars : [
		'total',
		'maximum',
		'compute'
	],
	#category : #System-Caching,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheWeight>>add: value [
	| weight |
	weight := compute cull: value.
	total := total + weight
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheWeight>>compute [
	^ compute
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheWeight>>compute: valuable [
	compute := valuable
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheWeight>>initialize [
	super initialize.
	total := 0.
	maximum := 16.
	compute := [ 1 ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheWeight>>isBelowMaximum [
	^ total <= maximum 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheWeight>>maximum [
	^ maximum
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheWeight>>maximum: integer [
	maximum := integer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheWeight>>remove: value [
	| weight |
	weight := compute cull: value.
	total := total - weight
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheWeight>>reset [
	total := 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheWeight>>total [
	^ total
]
