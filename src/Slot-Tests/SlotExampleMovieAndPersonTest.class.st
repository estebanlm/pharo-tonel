"

"
Class {
	#name : #SlotExampleMovieAndPersonTest,
	#superclass : #TestCase,
	#category : #Slot-Tests-Associations,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testAddActors [

	| m1 m2 p1 p2 |
	
	m1 := SlotExampleMovie named: 'M1'.
	m2 := SlotExampleMovie named: 'M2'.
	p1 := SlotExamplePerson named: 'P1'.
	p2 := SlotExamplePerson named: 'P2'.
	
	m1 addActor: p1; addActor: p2.
	self assert: m1 actors size equals: 2.
	self assert: p1 actedInMovies size equals: 1.
	self assert: p1 actedInMovies anyOne equals: m1.
	self assert: p2 actedInMovies anyOne equals: m1.
	
	m2 addActor: p2.
	self assert: p2 actedInMovies size equals: 2.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testAddAndRemoveActors [

	| m1 m2 p1 p2 |
	
	m1 := SlotExampleMovie named: 'M1'.
	m2 := SlotExampleMovie named: 'M2'.
	p1 := SlotExamplePerson named: 'P1'.
	p2 := SlotExamplePerson named: 'P2'.
	
	m1 addActor: p1; addActor: p2.
	m2 addActor: p2.

	m1 removeActor: p2.
	self assert: p2 actedInMovies size equals: 1.
	m2 removeActor: p2.
	self assert: p2 actedInMovies isEmpty.
	
	self should: [ m2 removeActor: p2 ] raise: Error
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testAddMovieDirector [

	| movie person |
	
	movie := SlotExampleMovie named: 'Jaws'.
	person := SlotExamplePerson named: 'Peter'.
	
	person directedMovies add: movie.
	self assert: movie director equals: person.
	self assert: person directedMovies size equals: 1.
	self assert: person directedMovies anyOne equals: movie.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testAddMovieDirectorInvalid [

	| person |
	
	person := SlotExamplePerson named: 'Peter'.
	
	self should: [ person directedMovies add: 'not-a-movie' ] raise: Error
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testAddMovieDirectorTwice [

	| movie person |
	
	movie := SlotExampleMovie named: 'Jaws'.
	person := SlotExamplePerson named: 'Peter'.
	
	person directedMovies add: movie; add: movie.
	self assert: movie director equals: person.
	self assert: person directedMovies size equals: 1.
	self assert: person directedMovies anyOne equals: movie.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testChangeMovieDirector [

	| movie p1 p2 |
	
	movie := SlotExampleMovie named: 'Jaws'.
	p1 := SlotExamplePerson named: 'P1'.
	p2 := SlotExamplePerson named: 'P2'.
	
	movie director: p1.
	self assert: movie director equals: p1.
	self assert: p1 directedMovies anyOne equals: movie.
	self assert: p2 directedMovies isEmpty.
	
	movie director: p2.
	self assert: movie director equals: p2.
	self assert: p1 directedMovies isEmpty.
	self assert: p2 directedMovies anyOne equals: movie.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testNewMovie [

	| movie |
	
	movie := SlotExampleMovie new.
	self assert: movie name isNil.
	self assert: movie director isNil.
	self assert: movie actors isCollection.
	self assert: movie actors isEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testNewPerson [

	| person |
	
	person := SlotExamplePerson new.
	self assert: person name isNil.
	self assert: person directedMovies isCollection.
	self assert: person directedMovies isEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testSetAndRemoveMovieDirector [

	| movie person |
	
	movie := SlotExampleMovie named: 'Jaws'.
	person := SlotExamplePerson named: 'Peter'.
	
	movie director: person.
	self assert: movie director equals: person.
	self assert: person directedMovies anyOne equals: movie.
	
	person directedMovies remove: movie.
	self assert: movie director isNil.
	self assert: person directedMovies isEmpty.	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testSetAndUnsetMovieDirector [

	| movie person |
	
	movie := SlotExampleMovie named: 'Jaws'.
	person := SlotExamplePerson named: 'Peter'.
	
	movie director: person.
	self assert: movie director equals: person.
	self assert: person directedMovies anyOne equals: movie.
	
	movie director: nil.
	self assert: movie director isNil.
	self assert: person directedMovies isEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testSetMovieDirector [

	| movie person |
	
	movie := SlotExampleMovie named: 'Jaws'.
	person := SlotExamplePerson named: 'Peter'.
	
	movie director: person.
	self assert: movie director equals: person.
	self assert: person directedMovies size equals: 1.
	self assert: person directedMovies anyOne equals: movie.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testSetMovieDirectorInvalid [

	| movie |
	
	movie := SlotExampleMovie named: 'Jaws'.
	
	self should: [ movie director: 'not-a-person' ] raise: Error.
	self assert: movie director isNil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotExampleMovieAndPersonTest>>testSetMovieDirectorTwice [

	| movie person |
	
	movie := SlotExampleMovie named: 'Jaws'.
	person := SlotExamplePerson named: 'Peter'.
	
	movie director: person; director: person.
	self assert: movie director equals: person.
	self assert: person directedMovies size equals: 1.
	self assert: person directedMovies anyOne equals: movie.
]
