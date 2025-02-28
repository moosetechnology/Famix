"
An empty visitor for Famix entities

**/!\\** This was generated automatically as maximal visit (visiting all relations of all entities).
For example:
```
#visitFamixTMethod: aFamixTMethod
	aFamixTMethod parentType accept: self.

#visitFamixTWithMethods: aFamixTWithMethods
	self visitList: aFamixTWithMethods methods.
```

Using it without precaution will result in infinite visit.
Users **must redefine** some methods.
"
Trait {
	#name : #FamixTTraitVisitor,
	#category : #'Famix-Visitor'
}

{ #category : #visiting }
FamixTTraitVisitor >> visitFamixClassGroup: aFamixClassGroup [
	<generated>


]

{ #category : #visiting }
FamixTTraitVisitor >> visitFamixFileAnchorReader: aFamixFileAnchorReader [
	<generated>


]
