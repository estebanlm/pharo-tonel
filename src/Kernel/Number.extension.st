Extension {
	#name : #Number
}

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asDuration [
 
 	^ Duration seconds: self asInteger
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>asSeconds [
	^ Duration milliSeconds: self * 1000
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>day [
 
 	^ self days
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>days [
 
 	^ Duration days: self
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>hour [
 
 	^ self hours
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>hours [
 
 	^ Duration hours: self
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>milliSecond [
 
 	^ self milliSeconds
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>milliSeconds [
 
 	^ Duration milliSeconds: self
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>minute [
 
 	^ self minutes
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>minutes [
 
 	^ Duration minutes: self
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>nanoSecond [
 
 	^ self nanoSeconds
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>nanoSeconds [
 
 	^ Duration nanoSeconds: self.
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>second [
 
 	^ self seconds
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>seconds [
 
 	^ Duration seconds: self
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>week [
 
 	^ self weeks
 
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>weeks [
 
 	^ Duration weeks: self
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>year [
 
 	^self years
]

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Number>>years [
 
 	^ Duration years: self
]
