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
"
Trait {
	#name : #FamixJavaTCanBeSynchronized,
	#instVars : [
		'#isSynchronized => FMProperty'
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
