Class {
	#name : #CDClassDefinitionNode,
	#superclass : #CDBehaviorDefinitionNode,
	#instVars : [
		'subclass',
		'sharedSlotNodes',
		'superclassNameNode',
		'packageNameNode',
		'sharedPools',
		'superclassName'
	],
	#category : #'ClassParser-Model'
}

{ #category : #'instance-creation' }
CDClassDefinitionNode class >> on: aRBMessageNode [ 
	
	^ self new
		originalNode: aRBMessageNode;
		yourself
]

{ #category : #accessing }
CDClassDefinitionNode >> binding [ 
	Transcript show: '.'.
	^ self class environment associationAt: self className ifAbsent: [nil -> self].
]

{ #category : #testing }
CDClassDefinitionNode >> isClassDefinition [
	
	^ true
]

{ #category : #accessing }
CDClassDefinitionNode >> packageName [
	
	^ packageNameNode ifNotNil: [packageNameNode value asSymbol ]
]

{ #category : #accessing }
CDClassDefinitionNode >> packageNameNode [
	
	^ packageNameNode
]

{ #category : #accessing }
CDClassDefinitionNode >> packageNameNode: aNode astNode: astNode [

	packageNameNode := aNode.
	children add: aNode.
]

{ #category : #accessing }
CDClassDefinitionNode >> sharedPools [
	sharedPools ifNil: [ self sharedPools: OrderedCollection new. ].
	^sharedPools
]

{ #category : #accessing }
CDClassDefinitionNode >> sharedPools: aCollection [ 
	sharedPools := aCollection.
	children addAll: aCollection
]

{ #category : #accessing }
CDClassDefinitionNode >> sharedSlotNodes [
	
	^ sharedSlotNodes
]

{ #category : #accessing }
CDClassDefinitionNode >> sharedSlots [
	sharedSlotNodes ifNil:[
		sharedSlotNodes := Array new.
		].
	^ sharedSlotNodes
]

{ #category : #accessing }
CDClassDefinitionNode >> sharedSlots: aCollection [ 
	sharedSlotNodes := aCollection.
	children addAll: aCollection
]

{ #category : #accessing }
CDClassDefinitionNode >> superclassName [
	
	^ superclassName
]

{ #category : #accessing }
CDClassDefinitionNode >> superclassName: aString [
	superclassName := aString
]

{ #category : #accessing }
CDClassDefinitionNode >> superclassName: aName astNode: astNode [
	
	superclassName := aName.
	superclassNameNode := astNode.
	children add: astNode.
]

{ #category : #accessing }
CDClassDefinitionNode >> superclassNameNode [
	
	^ superclassNameNode
]

{ #category : #accessing }
CDClassDefinitionNode >> superclassNameNode: anObject [
	superclassNameNode := anObject
]
