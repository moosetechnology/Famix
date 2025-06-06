Class {
	#name : #FamixMetricsTest,
	#superclass : #TestCase,
	#instVars : [
		'p1m1',
		'p2m1',
		'p1m2',
		'p2m2',
		'p3m2',
		'p4m2',
		'classA',
		'classB',
		'classB1',
		'classB2',
		'classC',
		'classD',
		'classE',
		'classF',
		'classF1',
		'classG'
	],
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #accessing }
FamixMetricsTest class >> resources [
	^ {PackageBlueprintTestResource . LCOMTestResource. KGBForMetricsTestResource}
]

{ #category : #setup }
FamixMetricsTest >> importBlueprintPackages [
	| blueprintModel |
	blueprintModel := PackageBlueprintTestResource current model.

	p1m2 := blueprintModel entityNamed: #'Moose-TestResources-PackageBlueprint-P1'.
	p2m2 := blueprintModel entityNamed: #'Moose-TestResources-PackageBlueprint-P2'.
	p3m2 := blueprintModel entityNamed: #'Moose-TestResources-PackageBlueprint-P3'.
	p4m2 := blueprintModel entityNamed: #'Moose-TestResources-PackageBlueprint-P4'
]

{ #category : #setup }
FamixMetricsTest >> importKGBPackages [
	| kgbModel |
	kgbModel := KGBForMetricsTestResource current model.

	p1m1 := kgbModel entityNamed: #'Moose-TestResources-KGB-P1FullReferencer'.
	p2m1 := kgbModel entityNamed: #'Moose-TestResources-KGB-P2InteractedReferencerReferee'
]

{ #category : #setup }
FamixMetricsTest >> importLCOMClasses [
	| lcomModel |
	lcomModel := LCOMTestResource current model.

	classA := lcomModel entityNamed: #'Smalltalk.ClassA'.
	classB := lcomModel entityNamed: #'Smalltalk.ClassB'.
	classB1 := lcomModel entityNamed: #'Smalltalk.ClassB1'.
	classB2 := lcomModel entityNamed: #'Smalltalk.ClassB2'.
	classC := lcomModel entityNamed: #'Smalltalk.ClassC'.
	classD := lcomModel entityNamed: #'Smalltalk.ClassD'.
	classE := lcomModel entityNamed: #'Smalltalk.ClassE'.
	classF := lcomModel entityNamed: #'Smalltalk.ClassF'.
	classF1 := lcomModel entityNamed: #'Smalltalk.ClassF1'.
	classG := lcomModel entityNamed: #'Smalltalk.ClassG'
]

{ #category : #running }
FamixMetricsTest >> setUp [
	super setUp.
	self flag: #todo.	"Ideally we should also have metrics tests with a test model in Moose-Core-Tests."
	self
		importKGBPackages;
		importBlueprintPackages;
		importLCOMClasses
]

{ #category : #tests }
FamixMetricsTest >> testAbstractnessFamixClassGroup [
	| class1 class2 class3 class4 class5 class6 class7 class8 class9 class10 class11 class12 class13 class14 class15 class16 f |
	class1 := (p1m1 allClasses detect: [ :each | each name = #M1P1C1FullReferencerOutSide ]).
	class2 := (p2m1 allClasses detect: [ :each | each name = #M1P2C2ReferencerOutSideRefereeInSide ]).
	class3 := (p2m1 allClasses detect: [ :each | each name = #M1P2C3ReferencerInSideRefereeOutSide ]).
	class4 := (p2m1 allClasses detect: [ :each | each name = #M1P2C4FullRefereeInSide ]).
	f := FamixTypeGroup new.
	f add: class1.
	self assert: f abstractness equals: 0.0.
	f := FamixTypeGroup new.
	f
		add: class2;
		add: class3;
		add: class4.
	self assert: f abstractness equals: 0.0.
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4.
	self assert: f abstractness equals: 0.0.
	class1 := (p1m2 allClasses detect: [ :each | each name = #A1 ]).
	class2 := (p1m2 allClasses detect: [ :each | each name = #B1 ]).
	class3 := (p1m2 allClasses detect: [ :each | each name = #C1 ]).
	class4 := (p1m2 allClasses detect: [ :each | each name = #D1 ]).
	class5 := (p1m2 allClasses detect: [ :each | each name = #E1 ]).
	class6 := (p1m2 allClasses detect: [ :each | each name = #F1 ]).
	class7 := (p1m2 allClasses detect: [ :each | each name = #G1 ]).
	class8 := (p1m2 allClasses detect: [ :each | each name = #H1 ]).
	class9 := (p1m2 allClasses detect: [ :each | each name = #I1 ]).
	class9 := (p1m2 allClasses detect: [ :each | each name = #I1 ]).
	class10 := (p2m2 allClasses detect: [ :each | each name = #A2 ]).
	class11 := (p2m2 allClasses detect: [ :each | each name = #B2 ]).
	class12 := (p3m2 allClasses detect: [ :each | each name = #A3 ]).
	class13 := (p3m2 allClasses detect: [ :each | each name = #B3 ]).
	class14 := (p3m2 allClasses detect: [ :each | each name = #C3 ]).
	class15 := (p4m2 allClasses detect: [ :each | each name = #A4 ]).
	class16 := (p4m2 allClasses detect: [ :each | each name = #B4 ]).
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4;
		add: class5;
		add: class6;
		add: class7;
		add: class8;
		add: class9.
	self assert: f abstractness equals: 0.0.
	f := FamixTypeGroup new.
	f
		add: class10;
		add: class11.
	self assert: f abstractness equals: 0.0.
	f := FamixTypeGroup new.
	f
		add: class12;
		add: class13;
		add: class14.
	self assert: f abstractness equals: 0.0.
	f := FamixTypeGroup new.
	f
		add: class15;
		add: class16.
	self assert: f abstractness equals: 0.0.
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4;
		add: class5;
		add: class6;
		add: class7;
		add: class8;
		add: class9;
		add: class10;
		add: class11.
	self assert: f abstractness equals: 0.0.
	f := FamixTypeGroup new.
	f
		add: class12;
		add: class13;
		add: class14;
		add: class15;
		add: class16.
	self assert: f abstractness equals: 0.0
]

{ #category : #tests }
FamixMetricsTest >> testAbstractnessFamixPackage [
	self assert: p1m1 abstractness equals: 0.0.
	self assert: p2m1 abstractness equals: 0.0.
	self assert: p1m2 abstractness equals: 0.0.
	self assert: p2m2 abstractness equals: 0.0.
	self assert: p3m2 abstractness equals: 0.0.
	self assert: p4m2 abstractness equals: 0.0
]

{ #category : #tests }
FamixMetricsTest >> testAfferentCouplingFamixClassGroup [
	| class1 class2 class3 class4 class5 class6 class7 class8 class9 class10 class11 class12 class13 class14 class15 class16 f |
	class1 := p1m1 allClasses detect: [ :each | each name = #M1P1C1FullReferencerOutSide ].
	class2 := p2m1 allClasses detect: [ :each | each name = #M1P2C2ReferencerOutSideRefereeInSide ].
	class3 := p2m1 allClasses detect: [ :each | each name = #M1P2C3ReferencerInSideRefereeOutSide ].
	class4 := p2m1 allClasses detect: [ :each | each name = #M1P2C4FullRefereeInSide ].
	f := FamixTypeGroup new.
	f add: class1.
	self assert: f afferentCoupling equals: 0.
	f := FamixTypeGroup new.
	f
		add: class2;
		add: class3;
		add: class4.	"M1P1C1FullReferencerOutSide"
	self assert: f afferentCoupling equals: 1.
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4.
	self assert: f afferentCoupling equals: 0.
	class1 := p1m2 allClasses detect: [ :each | each name = #A1 ].
	class2 := p1m2 allClasses detect: [ :each | each name = #B1 ].
	class3 := p1m2 allClasses detect: [ :each | each name = #C1 ].
	class4 := p1m2 allClasses detect: [ :each | each name = #D1 ].
	class5 := p1m2 allClasses detect: [ :each | each name = #E1 ].
	class6 := p1m2 allClasses detect: [ :each | each name = #F1 ].
	class7 := p1m2 allClasses detect: [ :each | each name = #G1 ].
	class8 := p1m2 allClasses detect: [ :each | each name = #H1 ].
	class9 := p1m2 allClasses detect: [ :each | each name = #I1 ].
	class10 := p2m2 allClasses detect: [ :each | each name = #A2 ].
	class11 := p2m2 allClasses detect: [ :each | each name = #B2 ].
	class12 := p3m2 allClasses detect: [ :each | each name = #A3 ].
	class13 := p3m2 allClasses detect: [ :each | each name = #B3 ].
	class14 := p3m2 allClasses detect: [ :each | each name = #C3 ].
	class15 := p4m2 allClasses detect: [ :each | each name = #A4 ].
	class16 := p4m2 allClasses detect: [ :each | each name = #B4 ].
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4;
		add: class5;
		add: class6;
		add: class7;
		add: class8;
		add: class9.
	self assert: f afferentCoupling equals: 0.
	f := FamixTypeGroup new.
	f
		add: class10;
		add: class11.
	self assert: f afferentCoupling equals: 2.
	f := FamixTypeGroup new.
	f
		add: class12;
		add: class13;
		add: class14.
	self assert: f afferentCoupling equals: 3.
	f := FamixTypeGroup new.
	f
		add: class15;
		add: class16.
	self assert: f afferentCoupling equals: 1.
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4;
		add: class5;
		add: class6;
		add: class7;
		add: class8;
		add: class9;
		add: class10;
		add: class11.
	self assert: f afferentCoupling equals: 0.
	f := FamixTypeGroup new.
	f
		add: class12;
		add: class13;
		add: class14;
		add: class15;
		add: class16.
	self assert: f afferentCoupling equals: 2
]

{ #category : #tests }
FamixMetricsTest >> testAfferentCouplingFamixPackage [
	self assert: p1m1 afferentCoupling equals: 0.
	self assert: p2m1 afferentCoupling equals: 1.
	self assert: p1m2 afferentCoupling equals: 0.
	self assert: p2m2 afferentCoupling equals: 2.
	self assert: p3m2 afferentCoupling equals: 3.
	self assert: p4m2 afferentCoupling equals: 1
]

{ #category : #tests }
FamixMetricsTest >> testDistanceFamixClassGroup [
	| class1 class2 class3 class4 class5 class6 class7 class8 class9 class10 class11 class12 class13 class14 class15 class16 f |
	class1 := p1m1 allClasses detect: [ :each | each name = #M1P1C1FullReferencerOutSide ].
	class2 := p2m1 allClasses detect: [ :each | each name = #M1P2C2ReferencerOutSideRefereeInSide ].
	class3 := p2m1 allClasses detect: [ :each | each name = #M1P2C3ReferencerInSideRefereeOutSide ].
	class4 := p2m1 allClasses detect: [ :each | each name = #M1P2C4FullRefereeInSide ].
	f := FamixTypeGroup new.
	f add: class1.
	self assert: f distance equals: 0.0.
	f := FamixTypeGroup new.
	f
		add: class2;
		add: class3;
		add: class4.
	self assert: f distance equals: -0.25.
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4.
	self assert: f distance equals: 0.0.
	class1 := p1m2 allClasses detect: [ :each | each name = #A1 ].
	class2 := p1m2 allClasses detect: [ :each | each name = #B1 ].
	class3 := p1m2 allClasses detect: [ :each | each name = #C1 ].
	class4 := p1m2 allClasses detect: [ :each | each name = #D1 ].
	class5 := p1m2 allClasses detect: [ :each | each name = #E1 ].
	class6 := p1m2 allClasses detect: [ :each | each name = #F1 ].
	class7 := p1m2 allClasses detect: [ :each | each name = #G1 ].
	class8 := p1m2 allClasses detect: [ :each | each name = #H1 ].
	class9 := p1m2 allClasses detect: [ :each | each name = #I1 ].
	class10 := p2m2 allClasses detect: [ :each | each name = #A2 ].
	class11 := p2m2 allClasses detect: [ :each | each name = #B2 ].
	class12 := p3m2 allClasses detect: [ :each | each name = #A3 ].
	class13 := p3m2 allClasses detect: [ :each | each name = #B3 ].
	class14 := p3m2 allClasses detect: [ :each | each name = #C3 ].
	class15 := p4m2 allClasses detect: [ :each | each name = #A4 ].
	class16 := p4m2 allClasses detect: [ :each | each name = #B4 ].
	
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4;
		add: class5;
		add: class6;
		add: class7;
		add: class8;
		add: class9.
	self assert: f distance equals: 0.0.
	f := FamixTypeGroup new.
	f
		add: class10;
		add: class11.
	self assert: (f distance roundUpTo: 0.001) equals: -0.666.
	f := FamixTypeGroup new.
	f
		add: class12;
		add: class13;
		add: class14.
	self assert: f distance equals: -0.75.
	f := FamixTypeGroup new.
	f
		add: class15;
		add: class16.
	self assert: (f distance roundUpTo: 0.001) equals: -0.333.
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4;
		add: class5;
		add: class6;
		add: class7;
		add: class8;
		add: class9;
		add: class10;
		add: class11.
	self assert: f distance equals: 0.0.
	f := FamixTypeGroup new.
	f
		add: class12;
		add: class13;
		add: class14;
		add: class15;
		add: class16.
	self assert: (f distance roundUpTo: 0.001) equals: -0.666
]

{ #category : #tests }
FamixMetricsTest >> testDistanceFamixPackage [
	self assert: p1m1 distance equals: 0.0.
	self assert: p2m1 distance equals: -0.25.
	self assert: p1m2 distance equals: 0.0.
	self assert: p2m2 distance equals: -2 / 3.
	self assert: p3m2 distance equals: -0.75.
	self assert: p4m2 distance equals: -1 / 3
]

{ #category : #tests }
FamixMetricsTest >> testEfferentCouplingFamixClassGroup [
	| class1 class2 class3 class4 class5 class6 class7 class8 class9 class10 class11 class12 class13 class14 class15 class16 f |
	class1 := p1m1 allClasses detect: [ :each | each name = #M1P1C1FullReferencerOutSide ].
	class2 := p2m1 allClasses detect: [ :each | each name = #M1P2C2ReferencerOutSideRefereeInSide ].
	class3 := p2m1 allClasses detect: [ :each | each name = #M1P2C3ReferencerInSideRefereeOutSide ].
	class4 := p2m1 allClasses detect: [ :each | each name = #M1P2C4FullRefereeInSide ].
	f := FamixTypeGroup new.
	f add: class1.	"M2P6C13FullRefereeInSideOutSide 
	M2P5C11FullRefereeOutSide
	M1P2C3ReferencerInSideRefereeOutSide
	Object"
	self assert: f efferentCoupling equals: 4.
	f := FamixTypeGroup new.
	f
		add: class2;
		add: class3;
		add: class4.	"M3P7C14ReferencerOutSideRefereeOutSide
	M2P5C11FullRefereeOutSide
	Object"
	self assert: f efferentCoupling equals: 3.
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4.	"M2P6C13FullRefereeInSideOutSide 
	M2P5C11FullRefereeOutSide
	M3P7C14ReferencerOutSideRefereeOutSide
	Object"
	self assert: f efferentCoupling equals: 4.
	class1 := p1m2 allClasses detect: [ :each | each name = #A1 ].
	class2 := p1m2 allClasses detect: [ :each | each name = #B1 ].
	class3 := p1m2 allClasses detect: [ :each | each name = #C1 ].
	class4 := p1m2 allClasses detect: [ :each | each name = #D1 ].
	class5 := p1m2 allClasses detect: [ :each | each name = #E1 ].
	class6 := p1m2 allClasses detect: [ :each | each name = #F1 ].
	class7 := p1m2 allClasses detect: [ :each | each name = #G1 ].
	class8 := p1m2 allClasses detect: [ :each | each name = #H1 ].
	class9 := p1m2 allClasses detect: [ :each | each name = #I1 ].
	class10 := p2m2 allClasses detect: [ :each | each name = #A2 ].
	class11 := p2m2 allClasses detect: [ :each | each name = #B2 ].
	class12 := p3m2 allClasses detect: [ :each | each name = #A3 ].
	class13 := p3m2 allClasses detect: [ :each | each name = #B3 ].
	class14 := p3m2 allClasses detect: [ :each | each name = #C3 ].
	class15 := p4m2 allClasses detect: [ :each | each name = #A4 ].
	class16 := p4m2 allClasses detect: [ :each | each name = #B4 ].
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4;
		add: class5;
		add: class6;
		add: class7;
		add: class8;
		add: class9.	"A2
	B2
	A3 B3 C3
	A4
	Object"
	self assert: f efferentCoupling equals: 7.
	f := FamixTypeGroup new.
	f
		add: class10;
		add: class11.	"Object"
	self assert: f efferentCoupling equals: 1.
	f := FamixTypeGroup new.
	f
		add: class12;
		add: class13;
		add: class14.	"Object"
	self assert: f efferentCoupling equals: 1.
	f := FamixTypeGroup new.
	f
		add: class15;
		add: class16.	"B3
	Object"
	self assert: f efferentCoupling equals: 2.
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4;
		add: class5;
		add: class6;
		add: class7;
		add: class8;
		add: class9;
		add: class10;
		add: class11.	"A3 B3 C3
	A4
	Object"
	self assert: f efferentCoupling equals: 5.
	f := FamixTypeGroup new.
	f
		add: class12;
		add: class13;
		add: class14;
		add: class15;
		add: class16.	"Object"
	self assert: f efferentCoupling equals: 1
]

{ #category : #tests }
FamixMetricsTest >> testEfferentCouplingFamixPackage [
	self assert: p1m1 efferentCoupling equals: 4.	"Object M2P6C13 M2P5C11 M1 P2C3"
	self assert: p2m1 efferentCoupling equals: 3.	"Object M3P7C14 M2P5C11"
	self assert: p1m2 efferentCoupling equals: 7.	"Object A2 B2  A3 B3 C3 A4"
	self assert: p2m2 efferentCoupling equals: 1.	"Object"
	self assert: p3m2 efferentCoupling equals: 1.	"Object"
	self assert: p4m2 efferentCoupling equals: 2	"Object A3"
]

{ #category : #tests }
FamixMetricsTest >> testInstabilityFamixClassGroup [
	| class1 class2 class3 class4 class5 class6 class7 class8 class9 class10 class11 class12 class13 class14 class15 class16 f |
	class1 := p1m1 allClasses detect: [ :each | each name = #M1P1C1FullReferencerOutSide ].
	class2 := p2m1 allClasses detect: [ :each | each name = #M1P2C2ReferencerOutSideRefereeInSide ].
	class3 := p2m1 allClasses detect: [ :each | each name = #M1P2C3ReferencerInSideRefereeOutSide ].
	class4 := p2m1 allClasses detect: [ :each | each name = #M1P2C4FullRefereeInSide ].
	f := FamixTypeGroup new.
	f add: class1.
	self assert: f instability equals: 1.0.
	f := FamixTypeGroup new.
	f
		add: class2;
		add: class3;
		add: class4.
	self assert: f instability equals: 0.75.
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4.
	self assert: f instability equals: 1.0.
	class1 := p1m2 allClasses detect: [ :each | each name = #A1 ].
	class2 := p1m2 allClasses detect: [ :each | each name = #B1 ].
	class3 := p1m2 allClasses detect: [ :each | each name = #C1 ].
	class4 := p1m2 allClasses detect: [ :each | each name = #D1 ].
	class5 := p1m2 allClasses detect: [ :each | each name = #E1 ].
	class6 := p1m2 allClasses detect: [ :each | each name = #F1 ].
	class7 := p1m2 allClasses detect: [ :each | each name = #G1 ].
	class8 := p1m2 allClasses detect: [ :each | each name = #H1 ].
	class9 := p1m2 allClasses detect: [ :each | each name = #I1 ].
	class10 := p2m2 allClasses detect: [ :each | each name = #A2 ].
	class11 := p2m2 allClasses detect: [ :each | each name = #B2 ].
	class12 := p3m2 allClasses detect: [ :each | each name = #A3 ].
	class13 := p3m2 allClasses detect: [ :each | each name = #B3 ].
	class14 := p3m2 allClasses detect: [ :each | each name = #C3 ].
	class15 := p4m2 allClasses detect: [ :each | each name = #A4 ].
	class16 := p4m2 allClasses detect: [ :each | each name = #B4 ].
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4;
		add: class5;
		add: class6;
		add: class7;
		add: class8;
		add: class9.
	self assert: f instability equals: 1.0.
	f := FamixTypeGroup new.
	f
		add: class10;
		add: class11.
	self assert: f instability equals: (1 / 3) asFloat.
	f := FamixTypeGroup new.
	f
		add: class12;
		add: class13;
		add: class14.
	self assert: f instability equals: (1 / 4) asFloat.
	f := FamixTypeGroup new.
	f
		add: class15;
		add: class16.
	self assert: f instability equals: (2 / 3) asFloat.
	f := FamixTypeGroup new.
	f
		add: class1;
		add: class2;
		add: class3;
		add: class4;
		add: class5;
		add: class6;
		add: class7;
		add: class8;
		add: class9;
		add: class10;
		add: class11.
	self assert: f instability equals: 1.0.
	f := FamixTypeGroup new.
	f
		add: class12;
		add: class13;
		add: class14;
		add: class15;
		add: class16.
	self assert: f instability equals: (1 / 3) asFloat
]

{ #category : #tests }
FamixMetricsTest >> testInstabilityFamixPackage [
	self assert: p1m1 instability equals: 1.0.
	self assert: p2m1 instability equals: 0.75.
	self assert: p1m2 instability equals: 1.0.
	self assert: p2m2 instability equals: 1 / 3.
	self assert: p3m2 instability equals: 0.25.
	self assert: p4m2 instability equals: 2 / 3
]

{ #category : #tests }
FamixMetricsTest >> testLCOM2 [
	self skip.
	self assert: classA lcom2 equals: 0.
	self assert: classB lcom2 equals: 0.
	self assert: classB1 lcom2 equals: 1/6.
	self assert: classB2 lcom2 equals: 1/6.
	self assert: classC lcom2 equals: 1/3.
	self assert: classD lcom2 equals: 0.
	self assert: classE lcom2 equals: 0.
	self assert: classF lcom2 equals: 1.
	self assert: classF1 lcom2 equals: 1.
	self assert: classG lcom3 equals: 0
]

{ #category : #tests }
FamixMetricsTest >> testLCOM3 [
	self skip.
	self assert: classA lcom3 equals: 0.
	self assert: classB lcom3 equals: 0.
	self assert: classB1 lcom3 equals: 0.25.
	self assert: classB2 lcom3 equals: 0.25.
	self assert: classC lcom3 equals: 0.5.
	self assert: classD lcom3 equals: 0.
	self assert: classE lcom3 equals: 0.
	self assert: classF lcom3 equals: 1.5.
	self assert: classF1 lcom3 equals: 2.
	self assert: classG lcom3 equals: 0
]

{ #category : #tests }
FamixMetricsTest >> testMartinCohesionFamixPackage [
self skip.
	self flag: 'should be rethink with FamixNG'.
	self assert: p1m1 martinCohesion equals: 1.0.	"i.e. (0+1)/1"
	self assert: p2m1 martinCohesion equals: 1.0.	"M1P2C3->M1P2C4 M1P2C3->M1P2C2"
	self assert: p1m2 martinCohesion equals: (10 / 9) asFloat.	"B1->A1 C1->A1 C1->D1 D1->E1 E1->C1 E1->D1 F1->E1 H1->G1 I1->G1"
	self assert: p2m2 martinCohesion equals: 0.5.
	self assert: p3m2 martinCohesion equals: 1.0.	"A3->C3 B3->C3"
	self assert: p4m2 martinCohesion equals: 0.5
]
