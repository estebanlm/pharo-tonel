"
I provide the support to test Pharo Case 13755. Not quite sure how to plug this into the testing framewok.  Currently just run this test manually like this...
    DelaySchedulerBackgroundWorkerMorph new openInWorld

which will FREEZE THE UI when using the following...
  * DelayMillisecondScheduler
  * DelayMicrosecondScheduler

but won't freeze when using  the following...
  * DelayExperimentalSemaphoreScheduler
  * DelayExperimentalSpinScheduler
  * DelayExperimentalCourageousScheduler

Close my instance morphs via halos, or evaluate the following...
    DelaySchedulerBackgroundWorkerMorph allInstances do: #delete.


"
Class {
	#name : #DelaySchedulerBackgroundWorkerMorph,
	#superclass : #Morph,
	#instVars : [
		'work',
		'stringMorph',
		'morphDeleted'
	],
	#category : #Kernel-Tests-Processes,
	#timestamp : 'BenComan 3/25/2015 22:07'
}

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:30'
}
DelaySchedulerBackgroundWorkerMorph>>delete [
    morphDeleted := true.
    super delete.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:30'
}
DelaySchedulerBackgroundWorkerMorph>>initialize [
    "DelaySchedulerBackgroundWorkerMorph new openInWorld"
    | workerProcess controllerProcess |
    super initialize.
    self extent: (300@50).
    self color: Color red.
    self addMorphBack:  (stringMorph := StringMorph new).
    morphDeleted := false.      "see #delete"

    workerProcess :=  
    [     work := 0.
        [    10 milliSeconds asDelay wait.
            work := work + 1.
            morphDeleted.
        ] whileFalse.
    ] newProcess name: 'Background worker'.

    controllerProcess :=
    [     [    workerProcess resume. self color: Color green.
            10 milliSeconds asDelay wait.
            workerProcess suspend. self color: Color red.
            10 milliSeconds asDelay wait.
            morphDeleted.
        ] whileFalse.
    ] newProcess name: 'Controller'.

    controllerProcess resume.
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:30'
}
DelaySchedulerBackgroundWorkerMorph>>step [
    stringMorph contents: work printString 
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:30'
}
DelaySchedulerBackgroundWorkerMorph>>stepTime [
    ^ 50
]
