"
I allow an entity to be synchronized
ex:

```java
public class SynchronizedCounter {
    private int c = 0;

    public synchronized void increment() {
        c++;
    }
}
```

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isSynchronized` | `Boolean` | false | Entity can be declared synchronized|

"
Trait {
	#name : #FamixJavaTCanBeSynchronized,
	#instVars : [
		'#isSynchronized => FMProperty defaultValue: false'
	],
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTCanBeSynchronized classSide >> annotation [

	<FMClass: #TCanBeSynchronized super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixJavaTCanBeSynchronized >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaTCanBeSynchronized: self
]

{ #category : #accessing }
FamixJavaTCanBeSynchronized >> isSynchronized [

	<FMProperty: #isSynchronized type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Entity can be declared synchronized'>
	^ isSynchronized ifNil: [ isSynchronized := false ]
]

{ #category : #accessing }
FamixJavaTCanBeSynchronized >> isSynchronized: anObject [
	<generated>
	isSynchronized := anObject
]
