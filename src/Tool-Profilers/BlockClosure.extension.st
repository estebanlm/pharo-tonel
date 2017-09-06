Extension {
	#name : #BlockClosure
}

{
	#category : #'*Tool-Profilers',
	#timestamp : ' 8/31/2017 05:26:21'
}
BlockClosure>>timeProfile [
	^Smalltalk tools timeProfiler onBlock: self
]

{
	#category : #'*Tool-Profilers',
	#timestamp : ' 8/31/2017 05:26:21'
}
BlockClosure>>timeToRunWithoutGC [
	"Answer the number of milliseconds taken to execute this block without GC time."
 
	^ Smalltalk vm totalGCTime + self timeToRun asMilliSeconds -  Smalltalk vm totalGCTime

]
