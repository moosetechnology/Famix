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
	#name : #FamixJavaTCanBeVolatile,
	#instVars : [
		'#isVolatile => FMProperty'
	],
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTCanBeVolatile classSide >> annotation [

	<FMClass: #TCanBeVolatile super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixJavaTCanBeVolatile >> isVolatile [

	<FMProperty: #isVolatile type: #Boolean>
	<generated>
	<FMComment: 'Entity can be declared volatile'>
	^ isVolatile
]

{ #category : #accessing }
FamixJavaTCanBeVolatile >> isVolatile: anObject [
	<generated>
	isVolatile := anObject
]
