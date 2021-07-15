Class {
	#name : #FamixTraitTestAndTraitGenerator,
	#superclass : #FamixTestAndTraitGenerator,
	#category : #FamixTestGenerator
}

{ #category : #'generate for FMMany slot' }
FamixTraitTestAndTraitGenerator >> generateCodeForFMManySlotInitialization: aSlot [
	| traitSlotName1 traitSlotName2 | 
	"Example of what we want to generate
	method1 := MooseEntity new copyWithTalent: FamixTMethod.
	method1 class initializeSlots: method1.
	model add: method1.
	method2 := MooseEntity new copyWithTalent: FamixTMethod.
	method2 class initializeSlots: method2.
	model add: method2.
	self entity addMethod: method1.
	self entity addMethod: method2."
	traitSlotName1 := (self generateSlotNameOfTestTraitFrom: aSlot) asString , '1'.
	traitSlotName2 := (self generateSlotNameOfTestTraitFrom: aSlot) asString , '2'.
	^ String streamContents: [ :aStream | aStream nextPutAll: '<generated>';
		cr;
		nextPutAll:  traitSlotName1 ;
		nextPutAll: ' := MooseEntity new copyWithTalent: ';
		nextPutAll: aSlot targetClass name  ;
		nextPutAll: '.';
		cr;
		nextPutAll: traitSlotName1 ;
		nextPutAll: ' class initializeSlots: ';
		nextPutAll: traitSlotName1 ;
		nextPutAll: '.';
		cr;
		nextPutAll: 'model add: ';
		nextPutAll: traitSlotName1 ;
		nextPutAll: '.';
		cr;
		nextPutAll:  traitSlotName2 ;
		nextPutAll: ' := MooseEntity new copyWithTalent: ';
		nextPutAll: aSlot targetClass name  ;
		nextPutAll: '.';
		cr;
		nextPutAll: traitSlotName2 ;
		nextPutAll: ' class initializeSlots: ';
		nextPutAll: traitSlotName2 ;
		nextPutAll: '.';
		cr;
		nextPutAll: 'model add: ';
		nextPutAll: traitSlotName2 ;
		nextPutAll: '.';
		cr;
		nextPutAll: (self generateCodeForAddingSlotInCollection: traitSlotName1 for: aSlot);
		cr;
		nextPutAll: (self generateCodeForAddingSlotInCollection: traitSlotName2 for: aSlot) ]
]

{ #category : #'generate for FMOne slot' }
FamixTraitTestAndTraitGenerator >> generateCodeForFMOneSlotInitialization: aSlot [
	| traitSlotName | 
	"Example of what we want to generate
	access := MooseEntity new copyWithTalent: FamixTWithAccesses.
	access class initializeSlots: access.
	model add: access.
	self entity accessor: access."
	traitSlotName := aSlot name asString.
	^ String streamContents: [ :aStream | aStream nextPutAll: '<generated>';
		cr;
		nextPutAll:  traitSlotName ;
		nextPutAll: ' := MooseEntity new copyWithTalent: ';
		nextPutAll: aSlot targetClass name  ;
		nextPutAll: '. ';
		cr;
		nextPutAll: traitSlotName ;
		nextPutAll: ' class initializeSlots: ';
		nextPutAll: traitSlotName ;
		nextPutAll: '.';
		cr;
		nextPutAll: 'model add: ';
		nextPutAll: traitSlotName ;
		nextPutAll: '.';
		cr;
		nextPutAll: 'self entity ';
		nextPutAll: aSlot name;
		nextPutAll: ': ';
		nextPutAll: traitSlotName ;
		nextPutAll: '. ']
]

{ #category : #run }
FamixTraitTestAndTraitGenerator >> generateSetUpInTraitFor: aClass [
	^ String streamContents: [ :aStream | aStream
		nextPutAll: 'setUp';
		cr;
		nextPutAll: '<generated>';
		cr;
		nextPutAll: 'super setUp.';
		cr;
		nextPutAll: '	model := MooseModel new metamodel: FamixGenerator metamodel.';
		cr;
		nextPutAll: 'self entity: (MooseEntity new copyWithTalent:'; 
		nextPutAll: aClass name;
		nextPutAll: ').';
		cr;
		nextPutAll: 'self entity class initializeSlots: self entity.';
		cr;
		nextPutAll: 'model add: entity. '
		 ]
]
