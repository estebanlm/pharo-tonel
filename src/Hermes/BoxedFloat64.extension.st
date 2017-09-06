Extension {
	#name : #BoxedFloat64
}

{
	#category : #'*Hermes',
	#timestamp : ' 8/31/2017 07:16:17'
}
BoxedFloat64>>asExportedLiteral [
	^ HEBoxedFloat64 for: self
]
