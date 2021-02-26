"
I allow an entity to be transient
ex:

```java
public class Student implements Serializable{  
 transient int age; //Now it will not be serialized  
}  
```
"
Trait {
	#name : #FAMIXTCanBeTransient,
	#instVars : [
		'#isTransient => FMProperty'
	],
	#category : #'Famix-Compatibility-Entities-Traits'
}

{ #category : #meta }
FAMIXTCanBeTransient classSide >> annotation [

	<FMClass: #TCanBeTransient super: #Object>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXTCanBeTransient >> isTransient [

	<FMProperty: #isTransient type: #Boolean>
	<generated>
	<FMComment: 'Entity can be declared transient'>
	^ isTransient
]

{ #category : #accessing }
FAMIXTCanBeTransient >> isTransient: anObject [
	<generated>
	isTransient := anObject
]
