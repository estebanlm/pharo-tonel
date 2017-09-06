"
i represent close segment (when user issuing #close command to path builder)
"
Class {
	#name : #AthensCloseSegment,
	#superclass : #AthensLineSegment,
	#category : #Athens-Core-Paths,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCloseSegment>>accept: aVisitor [
	^ aVisitor closeSegment: self
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCloseSegment>>sendCommandTo: aBuilder [
	^ aBuilder close
	
]
