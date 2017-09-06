"
I am a an object representing a Windows platform. Use myself to access platform specific features.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : #WinPlatform,
	#superclass : #OSPlatform,
	#category : #System-Platforms,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
WinPlatform class>>isActivePlatform [
	"Answer whether the receiver is the active platform"
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
WinPlatform>>family [
	^#Windows
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:13'
}
WinPlatform>>isWindows [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
WinPlatform>>keyForValue: aKeyValue [
	^Key valueForWindowsPlatform: aKeyValue.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
WinPlatform>>lineEnding [

	^ String crlf
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
WinPlatform>>menuShortcutString [
	^ 'ctrl'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
WinPlatform>>virtualKey: virtualKeyCode [
	"Win32Platform virtualKey: $C charCode"

	(virtualKeyCode between: 65 "$A charCode" and: 90 "$Z")
		ifFalse: [^nil].
	"#($a $b $c $d $e $f $g $h $i $j $k $l $m $n $o $p $q $r $s $t $u $v $w $x $y $z)"
	
	^(#($a nil $c $d nil $f $g nil nil nil nil $l $m $n nil $p nil nil $s nil nil $v nil $x nil $z)
		at: virtualKeyCode-64) ifNotNil: [:char | char charCode]
]
