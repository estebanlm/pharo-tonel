"
SUnit tests for monitors
"
Class {
	#name : #MonitorTest,
	#superclass : #TestCase,
	#category : #Kernel-Tests-Processes,
	#timestamp : 'TorstenBergmann 2/5/2014 08:41'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
MonitorTest>>testExample1 [

	| producer1 producer2  monitor goal work counter goalReached finished |
	goal := (1 to: 1000) asOrderedCollection.
	work := OrderedCollection new.
	counter := 0.
	goalReached := false.
	finished := Semaphore new.
	monitor := Monitor new.

	producer1 := [
       [monitor critical:
             [monitor waitUntil: [counter \\5 = 0].
              goalReached or: [work add: (counter := counter + 1)].
              goalReached := counter >= goal size.
              monitor signal
            ].
           goalReached
          ]
             whileFalse.
         finished signal.
	].

	producer2 := [
         [monitor critical:
                [monitor waitWhile: [counter \\5 = 0].
                 goalReached or: [work add: (counter := counter + 1)].
                 goalReached := counter >= goal size.
                 monitor signal].
         goalReached
       ] whileFalse.
     finished signal
	].

	producer1 forkAt: Processor userBackgroundPriority.
	producer2 forkAt: Processor userBackgroundPriority.

	finished wait; wait.
	self assert: goal = work
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:30'
}
MonitorTest>>testExample2 [
	"Here is a second version that does not use a semaphore to inform the 
	forking process about termination of both forked processes"

	| producer1 producer2  monitor goal work counter goalReached activeProducers|
	goal := (1 to: 1000) asOrderedCollection.
	work := OrderedCollection new.
	counter := 0.
	goalReached := false.
	activeProducers := 0.
	monitor := Monitor new.

  producer1 :=
      [ monitor critical: [activeProducers := activeProducers + 1].
  [monitor critical:
            [monitor waitUntil: [counter \\5 = 0].
      goalReached or: [work add: (counter := counter + 1)].
     " Transcript show: 'P1  '; show: counter printString; show: '  ';
       show: activeProducers printString; cr."
      goalReached := counter >= goal size.
      monitor signal
            ].
           goalReached
          ]
             whileFalse.
         monitor critical: [activeProducers := activeProducers - 1.
        monitor signal: #finish].
 ] .

 producer2 :=
    [monitor critical: [activeProducers := activeProducers + 1].

  [monitor critical:
          [monitor waitWhile: [counter \\5 = 0].
    goalReached or: [work add: (counter := counter + 1)].
    goalReached := counter >= goal size.
    monitor signal].
         goalReached ] whileFalse.
     monitor critical: [
		activeProducers := activeProducers - 1. 
		monitor signal: #finish].
	].

	producer1 forkAt: Processor userBackgroundPriority.
	producer2  forkAt: Processor userBackgroundPriority.


	monitor critical: [
		monitor waitUntil: [activeProducers = 0 & (goalReached)]
				for: #finish.
  	].

	self assert: goal = work

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MonitorTest>>testWaitMaxMilliseconds [
	| monitor |
	monitor := Monitor new.
	monitor critical: [ monitor waitMaxMilliseconds: 10 ].
]
