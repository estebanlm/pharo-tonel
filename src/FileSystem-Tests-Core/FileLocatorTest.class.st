"
SUnit test for FileLocator
"
Class {
	#name : #FileLocatorTest,
	#superclass : #TestCase,
	#instVars : [
		'locator'
	],
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:38'
}

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testAsAbsolute [
	locator := FileLocator image.
	self assert: locator asAbsolute = locator
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testBasename [
	locator := FileLocator image / 'griffle'.
	self assert: locator basename = 'griffle'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testCPath [
	| ref |
	ref := FileLocator C / 'WINDOWS'.
	self assert: (ref fileSystem isKindOf: FileSystem).
	self assert: ref path = (Path / 'C:' / 'WINDOWS')
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testCommaAddsExtension [
	locator := FileLocator image / 'griffle'.
	self assert: (locator , 'plonk') basename = 'griffle.plonk'
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testCommaAddsExtensionAgain [
	locator := FileLocator image / 'griffle.plonk'.
	self assert: (locator , 'nurp') basename = 'griffle.plonk.nurp'
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testContainsLocator [
	locator := FileLocator image.
	self assert: (locator contains: locator / 'griffle').
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testContainsPath [
	"self debug: #testContainsPath"
	
	locator := FileLocator image.
	self assert: (locator contains: (locator resolve / 'griffle') path).
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testContainsReference [
	locator := FileLocator image.
	self assert: (locator contains: (locator resolve / 'griffle')).
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testEqual [
	| a b |
	a := FileLocator image.
	b := FileLocator image.
	self deny: a == b.
	self assert: a = b.
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testExtension [
	locator := FileLocator image, 'bak'.
	self assert: (locator basename endsWith: '.bak')	
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testFileSystem [
	locator := FileLocator image.
	self assert: (locator fileSystem isKindOf: FileSystem)
]

{
	#category : #'resolution tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testImageDirectory [
	locator := FileLocator image.
	self assert: locator resolve = FileLocator image resolve
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testIsAbsolute [
	locator := FileLocator image.
	self assert: locator isAbsolute
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testIsNotRoot [
	locator := FileLocator image.
	self deny: locator isRoot
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testIsRelative [
	locator := FileLocator image.
	self deny: locator isRelative
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testIsRoot [
	locator := FileLocator image.
	(locator resolve path size) timesRepeat: [locator := locator / '..'].
	self assert: locator canonicalize isRoot
]

{
	#category : #'resolution tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testLocalDirectory [
	locator := FileLocator localDirectory.
	self assert: locator resolve fullName equals: (FileLocator imageDirectory resolve / (SystemResolver defaultLocalDirectoryName)) fullName
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testMoveTo [
	| old new |
	[
		old := FileLocator imageDirectory / 'testMoveTo_old'.
		old ensureCreateFile.
		
		new := FileLocator home / 'testMoveTo_new'.
		old moveTo: new.
		
		self deny: old exists.
		self assert: new exists.
	] ensure: [ 
		old ensureDelete.
		new ensureDelete.
	]
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testOriginBasename [
	locator := FileLocator image.
	self assert: locator basename = FileLocator image resolve basename
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testParent [
	locator := FileLocator image.
	self assert: locator parent resolve = FileLocator imageDirectory resolve
]

{
	#category : #'resolution tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testResolveAbsoluteReference [
	| result reference |
	locator := FileLocator image / 'plonk'.
	reference := FileSystem memory / 'griffle'.
	result := locator resolve: reference..
	self assert: result == reference
]

{
	#category : #'resolution tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testResolveCompoundString [
	| result compound |
	locator := FileLocator image / 'plonk'.
	compound := 'griffle', locator fileSystem delimiter asString, 'nurp'.
	result := locator resolve: compound.
	self assert: result class = locator class.
	self assert: result origin = locator origin.
	self assert: result path = ((Path * 'plonk') / 'griffle' / 'nurp')
]

{
	#category : #'resolution tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testResolvePath [
	| result path |
	locator := FileLocator image / 'plonk'.
	result := locator resolve: (Path * 'griffle').
	path := (Path * 'plonk') / 'griffle'.
	self assert: result class = locator class.
	self assert: result origin = locator origin.
	self assert: result path = path.
]

{
	#category : #'resolution tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testResolveRelativeReference [
	| result reference |
	locator := FileLocator image / 'plonk'.
	self flag: 'this is a bit weird...'.
	reference := FileSystem memory * 'griffle'.
	result := locator resolve: reference..
	self assert: result class= locator class.
	self assert: result origin = locator origin.
	self assert: result path = reference path.
]

{
	#category : #'resolution tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testResolveString [
	| result path |
	locator := FileLocator image / 'plonk'.
	result := locator resolve: 'griffle'.
	path := (Path * 'plonk') / 'griffle'.
	self assert: result class = locator class.
	self assert: result origin = locator origin.
	self assert: result path = path.
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testSlash [
	locator := FileLocator image / 'griffle'.
	self assert: locator = (FileLocator image / 'griffle')
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testWithExtensionAddsExtension [
	locator := FileLocator image / 'griffle'.
	self assert: (locator withExtension: 'plonk') basename = 'griffle.plonk'
]

{
	#category : #'compatibility tests',
	#timestamp : ' 8/31/2017 05:26:29'
}
FileLocatorTest>>testWithExtensionReplacesExtension [
	locator := FileLocator image / 'griffle.nurp'.
	self assert: (locator withExtension: 'plonk') basename = 'griffle.plonk'
]
