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
	#name : #FAMIXTCanBeSynchronized,
	#instVars : [
		'#isSynchronized => FMProperty'
	],
	#category : #'Famix-Compatibility-Entities-Traits'
}

{ #category : #meta }
FAMIXTCanBeSynchronized classSide >> annotation [

	<FMClass: #TCanBeSynchronized super: #Object>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXTCanBeSynchronized >> isSynchronized [

	<FMProperty: #isSynchronized type: #Boolean>
	<generated>
	<FMComment: 'Entity can be declared synchronized'>
	^ isSynchronized
]

{ #category : #accessing }
FAMIXTCanBeSynchronized >> isSynchronized: anObject [
	<generated>
	isSynchronized := anObject
]
