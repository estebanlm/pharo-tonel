"

"
Class {
	#name : #FFICalloutMethodBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'architecture'
	],
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>builder  [
	^ (FFICalloutAPI inContext: nil) newBuilder
		requestor: FFICalloutMethodBuilderTestRecuestor new;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>setUp [
	architecture := FFIArchitecture forCurrentArchitecture
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>testAllAtomicTypesCall [
	| result |
	
	result := self builder build: [ :builder |	
		builder 
			signature: #( void method1 (bool var1, byte var2, char var3, double var4, float var5, long var6, longlong var7, sbyte var8, schar var9, short var10, ulong var11, ulonglong var12, ushort var13) );
			sender: (FFICalloutMethodBuilderTestContext new
				selector: #methodV1:v2:v3:v4:v5:v6:v7:v8:v9:v10:v11:v12:v13:;
				argumentNames: #('var1' 'var2' 'var3' 'var4' 'var5' 'var6' 'var7' 'var8' 'var9' 'var10' 'var11' 'var12' 'var13');
				methodClass: Object;
				yourself )].
	
	self assert: result notNil.
	self assert: result isCompiledMethod.
	self assert: result primitive = 0.
	self assert: result literals first name = 'method1'.
	self assert: result literals first argTypes = { 
		ExternalType void. 
		ExternalType bool. 
		ExternalType byte. 
		ExternalType char. 
		ExternalType double. 
		ExternalType float.
		architecture externalLongType.
		ExternalType signedLongLong. 
		ExternalType sbyte.
		"schar and sbyte are the same size, and NB retrieves sbyte instead :("
		ExternalType sbyte. 
		ExternalType short. 
		architecture externalULongType. 
		ExternalType unsignedLongLong. 
		ExternalType ushort }
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>testCallCreateObject [
	| result |
	
	result := self builder build: [ :builder |	
		builder requestor requestor: FFICalloutObjectForTest.
		builder 
			signature: #( #FFICalloutObjectForTest method1( int var1 ) );
			sender: (FFICalloutMethodBuilderTestContext new
				selector: #method1:;
				argumentNames: #('var1');
				methodClass: FFICalloutObjectForTest;
				yourself )].

	self assert: result notNil.
	self assert: result isCompiledMethod.
	self assert: result primitive = 0.
	self assert: result literals first name = 'method1'.
	self assert: result literals first argTypes first = ExternalType void asPointerType. 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>testCallReturningEnumeration [
	| result |
	
	result := self builder build: [ :builder |	
		builder requestor requestor: FFICalloutObjectForTest.
		builder 
			signature: #( #FFITestEnumeration method1( int var1 ) );
			sender: (FFICalloutMethodBuilderTestContext new
				selector: #method1:;
				argumentNames: #('var1');
				methodClass: FFICalloutObjectForTest;
				yourself )].

	self assert: result notNil.
	self assert: result isCompiledMethod.
	self assert: result primitive = 0.
	self assert: result literals first name = 'method1'.
	self assert: result literals first argTypes first = ExternalType ulong.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>testCallSimple [
	| result |
	
	result := self builder build: [ :builder |	
		builder 
			signature: #( void method1 ( int var1 ) );
			sender: (FFICalloutMethodBuilderTestContext new
				selector: #method1:;
				argumentNames: #('var1');
				methodClass: Object;
				yourself )].
	
	self assert: result notNil.
	self assert: result isCompiledMethod.
	self assert: result primitive = 0.
	self assert: result literals first name = 'method1'.
	self assert: result literals first argTypes = { ExternalType void. ExternalType long }
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>testCallWithConstant [
	| result |
	
	result := self builder build: [ :builder |	
		builder 
			signature: #( void method1 ( int var1, 42 ) );
			sender: (FFICalloutMethodBuilderTestContext new
				selector: #method1:value:;
				argumentNames: #('var1' 'var2');
				methodClass: Object;
				yourself )].

	self assert: result notNil.
	self assert: result isCompiledMethod.
	self assert: result primitive = 0.
	self assert: result literals first name = 'method1'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>testCallWithObject [
	| result |
	
	result := self builder build: [ :builder |	
		builder requestor requestor: FFICalloutObjectForTest.
		builder 
			signature: #( void method1 ( #FFICalloutObjectForTest var1, int *var2 ) );
			sender: (FFICalloutMethodBuilderTestContext new
				selector: #method1:value:;
				argumentNames: #('var1' 'var2');
				methodClass: FFICalloutObjectForTest;
				yourself )].

	self assert: result notNil.
	self assert: result isCompiledMethod.
	self assert: result primitive = 0.
	self assert: result literals first name = 'method1'.
	self assert: result literals first argTypes last = ExternalType long asPointerType. 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>testCallWithPointer [
	| result |
	
	result := self builder build: [ :builder |	
		builder 
			signature: #( void method1 ( int var1, int *var2 ) );
			sender: (FFICalloutMethodBuilderTestContext new
				selector: #method1:value:;
				argumentNames: #('var1' 'var2');
				methodClass: Object;
				yourself )].

	self assert: result notNil.
	self assert: result isCompiledMethod.
	self assert: result primitive = 0.
	self assert: result literals first name = 'method1'.
	self assert: result literals first argTypes last = ExternalType long asPointerType. 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>testCallWithPointerPointer [
	| result |
	
	result := self builder build: [ :builder |	
		builder 
			signature: #( void method1 ( long **var1 ) );
			sender: (FFICalloutMethodBuilderTestContext new
				selector: #method1:;
				argumentNames: #('var1');
				methodClass: Object;
				yourself )].

	self assert: result notNil.
	self assert: result isCompiledMethod.
	self assert: result primitive = 0.
	self assert: result literals first name = 'method1'.
	self assert: result literals first argTypes last = architecture externalLongType asPointerType. 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTest>>testCallWithSelf [
	| result |
	
	result := self builder build: [ :builder |	
		builder requestor requestor: FFICalloutObjectForTest.
		builder 
			signature: #( void method1 ( self, int *var2 ) );
			sender: (FFICalloutMethodBuilderTestContext new
				selector: #method1:value:;
				argumentNames: #('var1' 'var2');
				methodClass: FFICalloutObjectForTest;
				yourself )].

	self assert: result notNil.
	self assert: result isCompiledMethod.
	self assert: result primitive = 0.
	self assert: result literals first name = 'method1'.
	self assert: result literals first argTypes last = ExternalType long asPointerType. 
]
