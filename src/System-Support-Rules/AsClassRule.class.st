"
Do not use methods such as

	#asClass
	#asClassIfAbsent:
	#asClassIfPresent:
	
because they do not take into account an environment. Instead use `self class environment at: #ClassName`
"
Class {
	#name : #AsClassRule,
	#superclass : #ReNodeRewriteRule,
	#category : #System-Support-Rules,
	#timestamp : 'YuriyTymchuk 9/1/2016 23:22'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
AsClassRule>>group [

	^ 'Design Flaws'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:47'
}
AsClassRule>>initialize [
	super initialize.
	self
		replace: '`@expr asClass'
		   with: 'self class environment at: `@expr';
		
		replace: '`@expr asClassIfAbsent: `@block'
		with: 'self class environment at: `@expr ifAbsent: `@block';
		
	replace: '`@expr asClassIfPresent: `@block'
		with: 'self class environment at: `@expr ifPresent: `@block'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
AsClassRule>>name [

	^ 'Do not use #asClass & similar'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
AsClassRule>>severity [

	^ #error
]
