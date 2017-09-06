"
ZdcOptimizedSocketStreamTests tests ZdcOptimizedSocketStream
"
Class {
	#name : #ZdcOptimizedSocketStreamTests,
	#superclass : #ZdcAbstractSocketStreamTests,
	#category : #Zodiac-Tests,
	#timestamp : 'SvenVanCaekenberghe 5/17/2011 19:09'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcOptimizedSocketStreamTests class>>isAbstract  [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcOptimizedSocketStreamTests>>socketStreamClass [
	^ ZdcOptimizedSocketStream 
]
