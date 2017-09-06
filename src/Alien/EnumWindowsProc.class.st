"
BOOL CALLBACK EnumWindowsProc(HWND hwnd, LPARAM lParam);

"
Class {
	#name : #EnumWindowsProc,
	#superclass : #Alien,
	#type : #bytes,
	#category : #Alien-Win32,
	#timestamp : 'eem 11/28/2007 14:28'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:09'
}
EnumWindowsProc class>>dataSize [
	^8
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
EnumWindowsProc>>hwnd [
	"BOOL CALLBACK EnumWindowsProc(HWND hwnd, LPARAM lParam);"
	^self unsignedLongAt: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
EnumWindowsProc>>lParam [
	"BOOL CALLBACK EnumWindowsProc(HWND hwnd, LPARAM lParam);"
	^self unsignedLongAt: 5
]
