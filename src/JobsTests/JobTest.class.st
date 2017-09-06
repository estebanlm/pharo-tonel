"
SUnit tests for Job class
"
Class {
	#name : #JobTest,
	#superclass : #TestCase,
	#category : #JobsTests,
	#timestamp : 'TorstenBergmann 2/5/2014 08:39'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
JobTest>>tearDown [

	Smalltalk globals at: #SystemProgressMorph ifPresent: [:spm | 
		spm uniqueInstance bars do: [ :e | e close ]] 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
JobTest>>testChildJob [
	
	| wasRun |
	
	wasRun := false.
	
	[ :job | 
	
		[ :job2 | 
			self assert: job children size = 1.
			self assert: job children first = job2.
			wasRun := true ] asJob run.
	
		self assert: job children isEmpty ] asJob run.
	
	self assert: wasRun.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
JobTest>>testCurrentJob [
	
	[ :job |
		[ :job2 |
			self assert: Job current == job2.
			self deny: Job current == job.
			] asJob run.
	
		self assert: Job current == job.
		] asJob run
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
JobTest>>testJobAnnouncements [
	
	| announcements |
	announcements := OrderedCollection new.

	Job jobAnnouncer weak when: JobStart send: #add: to: announcements.
	Job jobAnnouncer weak when: JobEnd send: #add: to: announcements.
	Job jobAnnouncer weak when: JobChange send: #add: to: announcements.

	self assert: announcements isEmpty.

	[ :job | job currentValue: 1 ] asJob run.	
	
	self 
		assert: (announcements collect: #class as: Array)
		equals: {JobStart. JobChange. JobEnd}.

	Job jobAnnouncer unsubscribe: announcements.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
JobTest>>testLookupJob [
	
	[ :job | 
		[ :job2 | | noneFound result |

			noneFound := false.
			result := job2 lookup: [ :aJob | aJob == job2 ] ifNone: [ noneFound := true ].
			self assert: result == job2.
			self deny: noneFound.
			
			result := job2 lookup: [ :aJob | aJob == job ] ifNone: [ noneFound := true ].
			self assert: result == job.
			self deny: noneFound.

			result := job lookup: [ :aJob | aJob == job2 ] ifNone: [ noneFound := true. 42 ].
			self assert: result = 42.
			self assert: noneFound.

			] asJob run.
	
		self assert: Job current == job.
		] asJob run
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
JobTest>>testOwner [
	
	[ :job |
		self assert: job owner == self.
		[ :job2 |
			self assert: job owner == self.
			self assert: job2 owner == self.
 		] asJob run.
	] asJob run.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
JobTest>>testProgress [
	| job |
	job := Job new.
	self assert: job progress equals: 0.0.
	job min: 0; max: 1.
	self assert: job progress equals: 0.0.
	job currentValue: 1.
	self assert: job progress equals: 1.0.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
JobTest>>testProgressChangeByCurrentValue [
	| job |
	job := Job new.
	job min: 1; max: 11.
	self assert: job progress equals: 0.0.
	job currentValue: 6.
	self assert: job progress equals: 0.5.
	job currentValue: 11.
	self assert: job progress equals: 1.0.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
JobTest>>testSingleJob [

	| wasRun |
	wasRun := false.
	[ :job | 
		self assert: job children isEmpty.
		wasRun := true ] asJob run.	
	self assert: wasRun.
]
