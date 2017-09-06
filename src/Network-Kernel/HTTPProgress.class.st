"
I am HTTPProgress, a notification to show progress when using HTTP.

I include
	- total: The total size of the download/upload (if known)
	- amount: The completed amount of the download/upload (if known)

Use #total:, #amount: or #amountLeft: to set the appropriate byte counts to indicate progress.
Use #fraction or #percentage as a value that indicates progress.
Total and amount are optional and can be nil. Test using #isEmpty.

You can try 
	HTTPProgress example.

"
Class {
	#name : #HTTPProgress,
	#superclass : #Notification,
	#instVars : [
		'total',
		'amount'
	],
	#category : #Network-Kernel,
	#timestamp : '<historical>'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress class>>example [
	"self example"
	
 	UIManager default informUserDuring: [ :bar |
		bar label: 'Transfer Demo...'.
		1 second asDelay wait.
		[ 1 to: 20 do: [ :each |
			HTTPProgress signal: 'Transferring...' amount: each * 1024 total: 20*1024.
			(Delay forMilliseconds: 100) wait ] ]
			on: HTTPProgress 
			do: [ :progress | 
				bar label: progress printString.
				progress isEmpty ifFalse: [ bar current: progress percentage ]. 
				progress resume ] ] 
]

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress class>>signal: signalerText amount: amount total: total [
	"Create and signal HTTPProgress with amount bytes transferred out of total.
	Use an additional signalerText."

	^ self new
		amount: amount;
		total: total;
		signal: signalerText
]

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress class>>signalAmount: amount total: total [
	"Create and signal HTTPProgress with amount bytes transferred out of total."
	
	^ self new
		amount: amount;
		total: total;
		signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>amount [
	"Answer the amount that has already been transferred.
	Can be nil. Should be between 0 and total."

	^ amount
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>amount: byteCount [
	"Set the amount of bytes that has already been transferred."

	amount := byteCount
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>amountLeft [
	"Answer the amount that has not yet been transferred.
	Can be nil. Should be between 0 and total."

	^ self isEmpty ifFalse: [ total - amount ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>amountLeft: byteCount [
	"Set the amount that has not yet been transferred.
	Can be nil. Should be between 0 and total."

	^ total ifNotNil: [ amount := total - byteCount ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>beComplete [
	"Make me complete, i.e. indicate that all bytes were transferred."

	amount := total
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>fraction [
	"Answer the fraction of total that has already been transferred.
	Can be nil. Should be between 0 and 1."
	
	^ self isEmpty ifFalse: [ amount / total ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>isComplete [
	"Answer true when I am complete, i.e. all bytes were transferred.
	When I am empty, I am also complete."

	^ amount = total
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>isEmpty [
	"Answer true if I do not contain a numerical progress indication."
  	
	^ amount isNil or: [ total isNil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>percentage [
	"Answer the percentage of total that has already been transferred.
	Can be nil. Should be between 0 and 100."

	^ self isEmpty ifFalse: [ self fraction * 100 ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>printOn: stream [
	"Print an extra progress percentage if available"
	
	super printOn: stream.
	self isEmpty 
		ifFalse: [ 
			stream space; print: self percentage rounded; nextPut: $% ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>total [
	"Answer the total byte count to transfer. Can be nil."

	^ total
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
HTTPProgress>>total: byteCount [
	"Set the total byte count to transfer"

	total := byteCount
]
