"
I'm the help page for welcoming new users. 
I pass through basic concepts to getting started with Pharo.
"
Class {
	#name : #WelcomeHelp,
	#superclass : #CustomHelp,
	#category : #Pharo-Help
}

{ #category : #accessing }
WelcomeHelp class >> bookName [
	"the character zero is a hack to display it always first"
	^ (Character value: 0) asString, 'Welcome'
]

{ #category : #pages }
WelcomeHelp class >> changeLog [
	^ HelpTopic 
		title: 'ChangeLog'
		contents: (self heading: 'Highlights (aka New Stuff) in Pharo 6.0'),
'- The PharoVM and image are also provided in a 64-bit version in Linux and macOS/OSX and bring even better performance and stability
- A new code changes management system named Epicea for reviewing and recovering of your code easily
- Integrated support for Git through an easy-to-use tool for repositories and commits management named Iceberg (as a preview in Pharo 6, it will be the default in Pharo 7)
- The unified foreign function interface (UnifiedFFI) for interfacing with the outside world is significantly improved
- The PharoVM is now part of OpenSmalltalk initiative
- Introduction of object immutability, alternative bytecode sets and block closures independent of outer context
- Pharo can now be bootstrapped from source code managed by Git
- Pharo modularity is improved
- Pharo is faster
- The Dark Theme was improved and set as default color theme of Pharo

', (self heading: 'All Issues'), 
'Over 1400 fixes and enhancements were integrated in this release.

As the complete list of fixed issues is too large to be placed here, you can review it on the FogBugz issue tracker (', (self url: 'https://pharo.fogbugz.com'), ') (requires account).', 
(self subheading: 'Tools'),
'- Epicea provides a code changes manager
- Iceberg provides a Git repositories manager
- GTInspector, GTDebugger and other tools are now based on FastTable (long lists of items are rendered much faster)
- GToolkit and GTools have been updated
- Quality Assistant has been improved
- Interrupt key (Cmd+ /, Ctrl+.) has been made more reliable
- Playground variables are now visible from debugger
- Debugger temp names mapping is fixed
- There is a "Close all debuggers"  in the taskbar context menu
- GTDebugger has a "Run to here" feature
- Results and critiques can be filtered in the MessageBrowser
- Dependency Analyzer has been improved
- Nautilus enhancements
        - Splitting of large variable entries in the Variables menu
        - Deprecated methods are shown with strikethrough emphasis
        - Abstract classes are shown in italics with a slight color adjustment', 
(self subheading: 'VM related'), 
'- 64-bits support
- Improvement of host platforms management (32-bit/64-bit)
- Improved UnifiedFFI
- The PharoVM is now part of OpenSmalltalk initiative
- Introduction of object immutability
- Introduction of FullBlockClosure which will help in future evolutions of Pharo
- Ephemerons support, introduction of the EphemeronRegistry
- Support of alternative bytecode sets and introduction of Sista Encoder, the encoder for the SistaV1 bytecode set. This will be the bedrock on which Pharo will improve',
(self subheading: 'Reflectivity'), 
'- General improvements
- haltOnce is active by default per method. It does not require global turning on (enable haltOnce) and it is managed from the source code area in Nautilus
- Execution counter for message nodes in the source code area in Nautilus
- API for Metalinks on AST nodes
- Mirror primitives (Those are reflection primitives which access object state without messaging them, see MirrorPrimitives class)
- Inlined method const can be implemented by Metalinks', 
(self subheading: 'Other'), 
'- Dark Theme improvements
- Improvement of theme change while windows are open
- Support of two double quotes inside comments
- Standalone Morphic worlds in separate windows
- Fix of several memory leaks
- Improvement of working directory structure (introduction of a ''pharo-local'' directory to include Pharo directories such as ''package-cache'')
- Better autocategorization of methods
- Introduction of a FuzzyMatcher for approximate string matching
- Glamour integration in Spec
- Renaming (Cmd+R / Ctrl+R) in Nautilus supports more AST nodes
- anObject asMethodConst to cache expressions dynamically
- GlobalIdentifier for computer identification
- NeoUUIDGenerator replaces the old UUIDGenerator
- STON was improved and is now used by Monticello FileTree
- Storage of suspended announcements
- Improved newAnonymousSubclass
- Inheritable process specific variables
- Fuel improvements
- Enablement of <example> methods so that they can be executed easily
- Support for <sampleInstance>
- New class and method API for tags as replacement for categories and protocols
- TabMorph improvements
- Unification of Dictionary APIs (including an OrderedDictionary)
- Package manifests improvements
- Improvement of RadioButton groups', 
(self subheading: 'Cleanups'), 
'- Object>>#name is now deprecated and will be removed in Pharo 7
- Better system modularization
- Ability for the system to be fully bootstrapped from source code
- Turn off of catalog search in Spotter by default (This improves the stability of Pharo when used with poor Internet connections)
- Removal of Chroma-CubeHelix and TxWorkspace
- Rename of Pragma>>#selector to Pragma>>#methodSelector
- Improvement of icons management (#iconNamed: introduced in order to replace DNU-based icons)
- Limit use of #asClass in order to rely on an environment
- It is now possible to give a rewrite rule when deprecating a method to automatically rewrite code with deprecation (#deprecated:transformWith:)
- Deprecation of the following:
        Object>>name
        ShortRunArray class
        Object>>confirm:orCancel:
        Object>>ifNil:ifNotNilDo:
        Object>>ifNotNilDo:
        Object>>ifNotNilDo:ifNil:
        Collection>>ifEmpty:ifNotEmptyDo:
        Collection>>ifNotEmptyDo:
        Collection>>ifNotEmptyDo:ifEmpty:
        SequenceableCollection>>copyLast:
        Integer>>asBytesDescription
        Pragma>>method:', 
(self subheading: 'Unit testing/Documentation'), 
'- RecursionStopper provides an easy way to check if we are in a recursion and execute code just once in a recursion
- New process specific variable ''CurrentExecutionEnvironment'' with value DefaultExecutionEnvironment by default and TestExecutionEnvironment during a test run
- SUnit is improved by introducing a time limit for tests, preventing "forked debuggers"
- New assert extension to compare floats with #closeTo:
- More class comments and documentation', 
(self subheading: 'Network'), 
'- Support Server Name Indication (SNI) in Zodiac/SSLPlugin
- Zinc/Zodiac update

You can see the Pharo 6.0 changelog at: 

', (self url: 'https://github.com/pharo-project/pharo-changelogs/blob/master/Pharo60ChangeLogs.md')
]

{ #category : #pages }
WelcomeHelp class >> documentation [
	^ HelpTopic 
		title: 'More Documentation'
		contents: (self heading: 'More Documentation'), 
		
	'The most important documentation is the one you can get by exploring the system, reading class comments and looking for examples. 
You can find "in image" help by clicking on the following expression:

', (self doItFrom: 'HelpBrowser open.'), '

This browser is also accessible from the World>Help>Help Browser menu (just click the desktop, select Help, and then Help Browser).

A compendium of Pharo documentation can be found at: 

', (self url: 'http://pharo.org/documentation'), '

There you can find:
- Pharo books: ', (self url: 'http://books.pharo.org'), '
- Screencasts: ', (self url: 'https://www.youtube.com/channel/UCp3mNigANqkesFzdm058bvw'), '
- Presentations: ', (self url: 'http://www.slideshare.net/pharoproject/')
]

{ #category : #pages }
WelcomeHelp class >> exploreEnvironment [
	^ HelpTopic 
		title: 'Explore the Pharo Environment'
		contents: (self heading: 'Explore the Pharo Environment'), 
		
		'The best way to learn Pharo is to explore it by yourself. This is live objects all the way down: they can be inspected, browsed, changed... everything in the environment you have in your hands.
But sometimes it can be hard to get started with the tools and capabilities the environment provides.

The most complete and updated guide for the Pharo environment can be found in the "Updated Pharo by Example" free book. It is still a work in progress, but most of it is already done. You can find the book here: 

', (self url: 'https://github.com/SquareBracketAssociates/UpdatedPharoByExample'), '

One chapter of particular interest is the one that provides a quick tour of the environment: 

', (self url: 'https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/book-result/PharoTour/PharoTour.pdf')
]

{ #category : #pages }
WelcomeHelp class >> gettingHelp [
	^ HelpTopic 
		title: 'Getting Help'
		contents: (self heading: 'Getting Help'),
		'Pharo has a vibrant community that shares knowledge in different ways: 

- The "Pharo Users" mailing list: 
	', (self url: 'http://lists.pharo.org/mailman/listinfo/pharo-users_lists.pharo.org'), '
- The "Pharo Discord channel": 
	', 	(self url: 'http://discord.gg/Sj2rhxn'), '
- The "Pharo IRC Channel": 
	', (self url: 'irc.freenode.net, #pharo channel '), '

You can find more information, lists to browse/suscribe and places to share code at: 

', (self url: 'http://pharo.org/community')
]

{ #category : #pages }
WelcomeHelp class >> learn [
	^ HelpTopic 
		title: 'Learn Pharo'
		contents: (self heading: 'Learn Pharo'), 		
'You can learn Pharo by clicking on the following expression: 
	
', (self doItFrom: 'ProfStef go.'), 

(self subheading: 'MOOC'), 
'Pharo has an excellent MOOC (Massive Open Online Course). You can find more information here: 

', (self url: 'http://mooc.pharo.org'), 

(self subheading: 'Books'), 
'There are several free Pharo books that can be download here: 

', (self url: 'http://books.pharo.org'), '

A very interesting starting point would be looking into the "Updated Pharo by Example" free book. It is still a work in progress, but most of it is already done. You can find the book here: 

', (self url: 'https://github.com/SquareBracketAssociates/UpdatedPharoByExample'), '
'
]

{ #category : #showing }
WelcomeHelp class >> open [
	<script>
	^ (HelpBrowser openOn: self) next
]

{ #category : #showing }
WelcomeHelp class >> openForRelease [
	<script>
	| browser window findBlock |
	
	findBlock := [ :each | (each isKindOf: SystemWindow) and: [ each label = self bookName ] ]. 
	World submorphs 
		detect: findBlock 
		ifFound: [ :oldWindow | oldWindow delete ].
	browser := self open.
	window := browser dependents detect: findBlock.
	window extent: 700@400.
	window center: Display extent / 2
]

{ #category : #accessing }
WelcomeHelp class >> pages [
	^ #(welcome changeLog learn exploreEnvironment useExternalPackages documentation gettingHelp)
]

{ #category : #pages }
WelcomeHelp class >> useExternalPackages [
	^ HelpTopic 
		title: 'Using Eternal Packages'
		contents: (self heading: 'Using External Packages'), 'Pharo already comes pre-loaded with a rich set of packages that you can use to explore the system and develop your own applications. However there is also a huge library of user contributed projects that you can also load using the "Catalog Browser". To open it click on the following expression:
		
', (self doItFrom: 'CatalogBrowser open.'), '

This browser is also accessible from the World>Tools>Catalog Browser menu (just click the desktop, select Tools, and then Catalog Browser).

Catalog projects can be browsed online: 

', (self url: 'http://catalog.pharo.org'), '

You can also a rough list (not very friendly) of many packages available stored in smalltalkhub repository:

', (self url: 'http://smalltalkhub.com/list'), '

(this list is not a compendium of packages for Pharo but is a good place to start looking for something in particular and which happens to not be present in the catalog).

The catalog can be enabled in Spotter by enabling the "Display catalog projects in Spotter" system preference.
'
]

{ #category : #pages }
WelcomeHelp class >> welcome [
	^ HelpTopic 
		title: 'Welcome to Pharo 6.0'
		contents: (self heading: 'Pharo 6.0'), 
		
'Welcome to Pharo, an immersive live programming environment.

Pharo is a pure object-oriented programming language and a powerful environment, focused on simplicity and immediate feedback (think IDE and OS rolled into one).

For more information, please visit here: 

', (self url: 'http://pharo.org'),
(self subheading: 'Color themes'),
'White theme: ', (self doItFrom: 'Pharo3Theme beCurrent. '), ' 
Dark theme: ', (self doItFrom: 'Pharo3DarkTheme beCurrent. ').
]
