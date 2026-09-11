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
	#name : 'FamixJavaTCanBeSynchronized',
	#instVars : [
		'#isSynchronized => FMProperty defaultValue: false'
	],
	#category : 'Famix-Java-Entities-Traits',
	#package : 'Famix-Java-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixJavaTCanBeSynchronized classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TCanBeSynchronized super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixJavaTCanBeSynchronized >> isSynchronized [

	<FMProperty: #isSynchronized type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Entity can be declared synchronized'>
	^ isSynchronized ifNil: [ isSynchronized := false ]
]

{ #category : 'accessing' }
FamixJavaTCanBeSynchronized >> isSynchronized: anObject [
	<ignoreForCoverage>
	<generated>
	isSynchronized := anObject
]
