"

"
Class {
	#name : #MetacelloPackagesSpecTestCase,
	#superclass : #MetacelloSpecTestCase,
	#category : #Metacello-TestsCore-Specs,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testAddGroupA [
    "used by MetacelloAbstractVersionConstructor>>group:overrides:"

    | packages group |
    packages := self packagesSpec.
    packages
        add:
            (self groupSpec
                name: 'Platform';
                includes: 'Core';
                yourself).
    packages
        add:
            (self groupSpec
                name: 'Platform';
                includes: 'Tests';
                yourself).
    group := packages packageNamed: 'Platform' ifAbsent: [ self assert: false ].
    self deny: (group includes includes: 'Core').
    self assert: (group includes includes: 'Tests')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testAddGroupB [
    "used by MetacelloAbstractVersionConstructor>>group:overrides:"

    | packages group |
    packages := self packagesSpec.
    packages
        add:
            {(self groupSpec
                name: 'Platform';
                includes: 'Core';
                yourself).
            (self groupSpec
                name: 'Platform';
                includes: 'Tests';
                yourself)}.
    group := packages packageNamed: 'Platform' ifAbsent: [ self assert: false ].
    self deny: (group includes includes: 'Core').
    self assert: (group includes includes: 'Tests')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testAddProjectA [
    "used by MetacelloAbstractVersionConstructor>>project:overrides:"

    | packages project projectReferenceSpec |
    packages := self packagesSpec.
    packages
        add:
            (self projectSpec
                name: 'Project';
                className: 'ConfigurationOfProjectA';
                versionString: #'stable';
                loads: #('MyPackage' 'MyTests');
                preLoadDoIt: #'preLoadDoItB';
                postLoadDoIt: #'postLoadDoItB';
                yourself).
    packages
        add:
            (self projectSpec
                name: 'Project';
                className: 'ConfigurationOfProject';
                versionString: '1.0';
                operator: #'<';
                loads: #('MyPackage');
                preLoadDoIt: #'preLoadDoIt';
                postLoadDoIt: #'postLoadDoIt';
                yourself).
    projectReferenceSpec := packages packageNamed: 'Project' ifAbsent: [ self assert: false ].
    self assert: projectReferenceSpec projectName = 'Project'.
    self assert: projectReferenceSpec versionString = '1.0'.
    self should: [ projectReferenceSpec includes: #() ] raise: Error.
    self should: [ projectReferenceSpec requires: #() ] raise: Error.
    self should: [ projectReferenceSpec answers: #() ] raise: Error.
    projectReferenceSpec
        projectDo: [ :prjct | self assert: projectReferenceSpec == prjct ]
        packageDo: [ :ignored | self assert: false ]
        groupDo: [ :ignored | self assert: false ].
    project := projectReferenceSpec referencedSpec.
    self assert: project name = 'Project'.
    self assert: project className = 'ConfigurationOfProject'.
    self assert: project versionString = '1.0'.
    self assert: project operator == #'<'.
    self assert: project loads = #('MyPackage').
    self assert: project preLoadDoIt value == #'preLoadDoIt'.
    self assert: project postLoadDoIt value == #'postLoadDoIt'.
    project
        projectDo: [ :prjct | self assert: project == prjct ]
        packageDo: [ :ignored | self assert: false ]
        groupDo: [ :ignored | self assert: false ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testAddProjectB [
    "used by MetacelloAbstractVersionConstructor>>project:overrides:"

    | packages project projectReferenceSpec |
    packages := self packagesSpec.
    packages
        add:
            {(self projectSpec
                name: 'Project';
                className: 'ConfigurationOfProjectA';
                versionString: #'stable';
                loads: #('MyPackage' 'MyTests');
                preLoadDoIt: #'preLoadDoItB';
                postLoadDoIt: #'postLoadDoItB';
                yourself).
            (self projectSpec
                name: 'Project';
                className: 'ConfigurationOfProject';
                versionString: '1.0';
                operator: #'<';
                loads: #('MyPackage');
                preLoadDoIt: #'preLoadDoIt';
                postLoadDoIt: #'postLoadDoIt';
                yourself)}.
    projectReferenceSpec := packages packageNamed: 'Project' ifAbsent: [ self assert: false ].
    self assert: projectReferenceSpec projectName = 'Project'.
    self assert: projectReferenceSpec versionString = '1.0'.
    self should: [ projectReferenceSpec includes: #() ] raise: Error.
    self should: [ projectReferenceSpec requires: #() ] raise: Error.
    self should: [ projectReferenceSpec answers: #() ] raise: Error.
    projectReferenceSpec
        projectDo: [ :prjct | self assert: projectReferenceSpec == prjct ]
        packageDo: [ :ignored | self assert: false ]
        groupDo: [ :ignored | self assert: false ].
    project := projectReferenceSpec referencedSpec.
    self assert: project name = 'Project'.
    self assert: project className = 'ConfigurationOfProject'.
    self assert: project versionString = '1.0'.
    self assert: project operator == #'<'.
    self assert: project loads = #('MyPackage').
    self assert: project preLoadDoIt value == #'preLoadDoIt'.
    self assert: project postLoadDoIt value == #'postLoadDoIt'.
    project
        projectDo: [ :prjct | self assert: project == prjct ]
        packageDo: [ :ignored | self assert: false ]
        groupDo: [ :ignored | self assert: false ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testCopyToGroup [
    "not currently used by MetacelloAbstractVersionConstructor"

    | packages group |
    packages := self packagesSpec.
    packages
        add:
            (self groupSpec
                name: 'Platform';
                includes: 'Core';
                yourself).
    packages
        merge:
            (self groupSpec
                name: 'Platform';
                includes: 'Tests';
                yourself).
    group := packages packageNamed: 'Platform' ifAbsent: [ self assert: false ].
    self assert: (group includes includes: 'Core').
    self assert: (group includes includes: 'Tests').
    group := self groupSpec
        name: 'PlatformCopy';
        includes: 'Copy';
        yourself.
    packages copy: 'Platform' to: group.
    group := packages packageNamed: 'PlatformCopy' ifAbsent: [ self assert: false ].
    self assert: (group includes includes: 'Core').
    self assert: (group includes includes: 'Copy').
    self assert: (group includes includes: 'Tests')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testCopyToProject [
    "used by MetacelloAbstractVersionConstructor>>project:copyFrom:with:"

    | packages project referenceSpec |
    packages := self packagesSpec.
    packages
        add:
            (self projectSpec
                name: 'Project';
                className: 'ConfigurationOfProjectA';
                versionString: #'stable';
                loads: #('MyPackage' 'MyTests');
                preLoadDoIt: #'preLoadDoItB';
                postLoadDoIt: #'postLoadDoItB';
                yourself).
    project := self projectSpec
        name: 'ProjectCopy';
        yourself.
    referenceSpec := self project projectReferenceSpec
        name: 'ProjectCopy';
        projectReference: project;
        yourself.
    packages copy: 'Project' to: referenceSpec.
    project := (packages packageNamed: 'ProjectCopy' ifAbsent: [ self assert: false ]) referencedSpec.
    self assert: project name = 'ProjectCopy'.
    self assert: project className = 'ConfigurationOfProjectA'.
    self assert: project versionString = #'stable'.
    self assert: project operator == #'>='.
    self assert: project loads = #('MyPackage' 'MyTests').
    self assert: project preLoadDoIt value == #'preLoadDoItB'.
    self assert: project postLoadDoIt value == #'postLoadDoItB'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testMergeGroupA [
    "used by MetacelloAbstractVersionConstructor>>group:with:"

    | packages group |
    packages := self packagesSpec.
    packages
        add:
            (self groupSpec
                name: 'Platform';
                includes: 'Core';
                yourself).
    packages
        merge:
            (self groupSpec
                name: 'Platform';
                includes: 'Tests';
                yourself).
    group := packages packageNamed: 'Platform' ifAbsent: [ self assert: false ].
    self assert: (group includes includes: 'Core').
    self assert: (group includes includes: 'Tests')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testMergeGroupB [
    "used by MetacelloAbstractVersionConstructor>>group:with:"

    | packages group |
    packages := self packagesSpec.
    packages
        add:
            (self groupSpec
                name: 'Platform';
                includes: 'Core';
                yourself).
    packages
        merge:
            {(self groupSpec
                name: 'Platform';
                includes: 'Tests';
                yourself)}.
    group := packages packageNamed: 'Platform' ifAbsent: [ self assert: false ].
    self assert: (group includes includes: 'Core').
    self assert: (group includes includes: 'Tests')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testMergeProjectA [
    "used by MetacelloAbstractVersionConstructor>>project:with:"

    | packages project projectReferenceSpec referenceSpec |
    packages := self packagesSpec.
    project := self projectSpec
        name: 'Project';
        className: 'ConfigurationOfProjectA';
        versionString: #'stable';
        loads: #('MyPackage' 'MyTests');
        preLoadDoIt: #'preLoadDoItB';
        postLoadDoIt: #'postLoadDoItB';
        yourself.
    referenceSpec := self project projectReferenceSpec
        name: project name;
        projectReference: project;
        yourself.
    packages add: referenceSpec.
    project := self projectSpec
        name: 'Project';
        className: 'ConfigurationOfProject';
        versionString: '1.0';
        operator: #'<';
        loads: #('MyPackage');
        preLoadDoIt: #'preLoadDoIt';
        postLoadDoIt: #'postLoadDoIt';
        yourself.
    referenceSpec := self project projectReferenceSpec
        name: project name;
        projectReference: project;
        yourself.
    packages merge: referenceSpec.
    projectReferenceSpec := packages packageNamed: 'Project' ifAbsent: [ self assert: false ].
    project := projectReferenceSpec referencedSpec.
    self assert: project name = 'Project'.
    self assert: project className = 'ConfigurationOfProject'.
    self assert: project versionString = '1.0'.
    self assert: project operator == #'<'.
    self assert: project loads = #('MyPackage').
    self assert: project preLoadDoIt value == #'preLoadDoIt'.
    self assert: project postLoadDoIt value == #'postLoadDoIt'.
    project
        projectDo: [ :prjct | self assert: project == prjct ]
        packageDo: [ :ignored | self assert: false ]
        groupDo: [ :ignored | self assert: false ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testMergeProjectB [
    "used by MetacelloAbstractVersionConstructor>>project:with:"

    | packages project projectReferenceSpec referenceSpec |
    packages := self packagesSpec.
    project := self projectSpec
        name: 'Project';
        className: 'ConfigurationOfProjectA';
        versionString: #'stable';
        loads: #('MyPackage' 'MyTests');
        preLoadDoIt: #'preLoadDoItB';
        postLoadDoIt: #'postLoadDoItB';
        yourself.
    referenceSpec := self project projectReferenceSpec
        name: project name;
        projectReference: project;
        yourself.
    packages add: referenceSpec.
    project := self projectSpec
        name: 'Project';
        className: 'ConfigurationOfProject';
        versionString: '1.0';
        operator: #'<';
        loads: #('MyPackage');
        preLoadDoIt: #'preLoadDoIt';
        postLoadDoIt: #'postLoadDoIt';
        yourself.
    referenceSpec := self project projectReferenceSpec
        name: project name;
        projectReference: project;
        yourself.
    packages merge: {referenceSpec}.
    projectReferenceSpec := packages packageNamed: 'Project' ifAbsent: [ self assert: false ].
    project := projectReferenceSpec referencedSpec.
    self assert: project name = 'Project'.
    self assert: project className = 'ConfigurationOfProject'.
    self assert: project versionString = '1.0'.
    self assert: project operator == #'<'.
    self assert: project loads = #('MyPackage').
    self assert: project preLoadDoIt value == #'preLoadDoIt'.
    self assert: project postLoadDoIt value == #'postLoadDoIt'.
    project
        projectDo: [ :prjct | self assert: project == prjct ]
        packageDo: [ :ignored | self assert: false ]
        groupDo: [ :ignored | self assert: false ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testRemoveGroupA [
    "used by MetacelloAbstractVersionConstructor>>removeGroup:"

    | packages group removed |
    packages := self packagesSpec.
    packages
        add:
            (self groupSpec
                name: 'Platform';
                includes: 'Core';
                yourself).
    packages
        merge:
            (self groupSpec
                name: 'Platform';
                includes: 'Tests';
                yourself).
    group := packages packageNamed: 'Platform' ifAbsent: [ self assert: false ].
    self assert: (group includes includes: 'Core').
    self assert: (group includes includes: 'Tests').
    packages
        remove:
            (self groupSpec
                name: 'Platform';
                includes: 'Core';
                yourself).
    removed := false.
    packages packageNamed: 'Platform' ifAbsent: [ removed := true ].
    self assert: removed
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testRemoveGroupB [
    "used by MetacelloAbstractVersionConstructor>>removeGroup:"

    | packages group removed |
    packages := self packagesSpec.
    packages
        add:
            {(self groupSpec
                name: 'Platform';
                includes: 'Core';
                yourself).
            (self groupSpec
                name: 'Base';
                includes: 'Base';
                yourself).
            (self groupSpec
                name: 'Tests';
                includes: 'Tests';
                yourself)}.
    packages packageNamed: 'Platform' ifAbsent: [ self assert: false ].
    packages packageNamed: 'Base' ifAbsent: [ self assert: false ].
    packages packageNamed: 'Tests' ifAbsent: [ self assert: false ].
    packages
        remove:
            {'Base'.
            'Tests'}.
    packages packageNamed: 'Platform' ifAbsent: [ self assert: false ].
    removed := false.
    packages packageNamed: 'Base' ifAbsent: [ removed := true ].
    self assert: removed.
    removed := false.
    packages packageNamed: 'Tests' ifAbsent: [ removed := true ].
    self assert: removed
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testRemoveGroupC [
    "used by MetacelloAbstractVersionConstructor>>removeGroup:"

    | packages group removed |
    packages := self packagesSpec.
    packages
        add:
            {(self groupSpec
                name: 'Platform';
                includes: 'Core';
                yourself).
            (self groupSpec
                name: 'Base';
                includes: 'Base';
                yourself).
            (self groupSpec
                name: 'Tests';
                includes: 'Tests';
                yourself)}.
    packages packageNamed: 'Platform' ifAbsent: [ self assert: false ].
    packages packageNamed: 'Base' ifAbsent: [ self assert: false ].
    packages packageNamed: 'Tests' ifAbsent: [ self assert: false ].
    packages remove: 'Tests'.
    packages packageNamed: 'Platform' ifAbsent: [ self assert: false ].
    packages packageNamed: 'Base' ifAbsent: [ self assert: false ].
    removed := false.
    packages packageNamed: 'Tests' ifAbsent: [ removed := true ].
    self assert: removed
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testRemoveProjectA [
    "used by MetacelloAbstractVersionConstructor>>removeProject:"

    | packages project projectReferenceSpec removed |
    packages := self packagesSpec.
    packages
        add:
            (self projectSpec
                name: 'Project';
                className: 'ConfigurationOfProject';
                versionString: '1.0';
                operator: #'<';
                loads: #('MyPackage');
                preLoadDoIt: #'preLoadDoIt';
                postLoadDoIt: #'postLoadDoIt';
                yourself).
    projectReferenceSpec := packages packageNamed: 'Project' ifAbsent: [ self assert: false ].
    project := projectReferenceSpec referencedSpec.
    self assert: project name = 'Project'.
    self assert: project className = 'ConfigurationOfProject'.
    self assert: project versionString = '1.0'.
    self assert: project operator == #'<'.
    self assert: project loads = #('MyPackage').
    self assert: project preLoadDoIt value == #'preLoadDoIt'.
    self assert: project postLoadDoIt value == #'postLoadDoIt'.
    packages
        remove:
            (self projectReferenceSpec
                name: 'Project';
                yourself).
    removed := false.
    packages packageNamed: 'Project' ifAbsent: [ removed := true ].
    self assert: removed
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloPackagesSpecTestCase>>testRemoveProjectB [
    "used by MetacelloAbstractVersionConstructor>>removeProject:"

    | packages project projectReferenceSpec removed |
    packages := self packagesSpec.
    packages
        add:
            (self projectSpec
                name: 'Project';
                className: 'ConfigurationOfProject';
                versionString: '1.0';
                operator: #'<';
                loads: #('MyPackage');
                preLoadDoIt: #'preLoadDoIt';
                postLoadDoIt: #'postLoadDoIt';
                yourself).
    projectReferenceSpec := packages packageNamed: 'Project' ifAbsent: [ self assert: false ].
    project := projectReferenceSpec referencedSpec.
    self assert: project name = 'Project'.
    self assert: project className = 'ConfigurationOfProject'.
    self assert: project versionString = '1.0'.
    self assert: project operator == #'<'.
    self assert: project loads = #('MyPackage').
    self assert: project preLoadDoIt value == #'preLoadDoIt'.
    self assert: project postLoadDoIt value == #'postLoadDoIt'.
    packages
        remove:
            {(self projectReferenceSpec
                name: 'Project';
                yourself)}.
    removed := false.
    packages packageNamed: 'Project' ifAbsent: [ removed := true ].
    self assert: removed
]
