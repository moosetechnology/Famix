"
I allow an entity to be volatible
ex:

```java
public class SharedObject {
    public volatile int counter = 0;
}
```
"
Trait {
	#name : #FAMIXTCanBeVolatile,
	#instVars : [
		'#isVolatile => FMProperty'
	],
	#category : #'Famix-Compatibility-Entities-Traits'
}

{ #category : #meta }
FAMIXTCanBeVolatile classSide >> annotation [

	<FMClass: #TCanBeVolatile super: #Object>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXTCanBeVolatile >> isVolatile [

	<FMProperty: #isVolatile type: #Boolean>
	<generated>
	<FMComment: 'Entity can be declared volatile'>
	^ isVolatile
]

{ #category : #accessing }
FAMIXTCanBeVolatile >> isVolatile: anObject [
	<generated>
	isVolatile := anObject
]
