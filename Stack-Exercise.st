!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'fj 6/6/2021 18:43:58'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ].
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 22:53:22'!
test01UpperCasePrefixInStack
	|stack sentenceFinder prefix arrayOfSentences|
	stack := OOStack new.
	prefix := 'Wint'. 
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'Winter Soldier'.  
	stack push: 'The winds of Winter'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: arrayOfSentences size equals: 1! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 22:47:01'!
test02NoPrefixInStack
	|stack sentenceFinder prefix arrayOfSentences|
	stack := OOStack new.
	prefix := 'Wint'. 
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'winter Soldier'.  
	stack push: 'The winds of Winter'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: arrayOfSentences size equals: 0! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 23:11:00'!
test03StackDoesNotChangeSize
	|stack stackSize sentenceFinder prefix arrayOfSentences|
	stack := OOStack new.
	prefix := 'Wint'. 
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'Winter Soldier'.  
	stack push: 'The winds of Winter'.
	stackSize := stack size.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: stack size equals: stackSize.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 22:51:53'!
test04StackWithNoElementsReturnsEmptyArray
	|stack sentenceFinder prefix arrayOfSentences|
	stack := OOStack new.
	prefix := 'Wint'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: arrayOfSentences size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 22:53:10'!
test05LowerCasePrefixInStack
	|stack sentenceFinder prefix arrayOfSentences|
	stack := OOStack new.
	prefix := 'wint'. 
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'Winter Soldier'.  
	stack push: 'The winds of Winter'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: arrayOfSentences size equals: 1! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 23:04:17'!
test06EmptyPrefixMustFail
	|stack sentenceFinder prefix |
	stack := OOStack new.
	prefix := ''. 
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'Winter Soldier'.  
	stack push: 'The winds of Winter'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	self
		should: [ sentenceFinder find: prefix. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixIsNotValid ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 23:08:44'!
test07BlanckSpaceInPrefixMustFail
	|stack sentenceFinder prefix |
	stack := OOStack new.
	prefix := 'Wint '. 
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'Winter Soldier'.  
	stack push: 'The winds of Winter'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	self
		should: [ sentenceFinder find: prefix. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithBlanckSpaceIsNotValid ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 23:18:12'!
test08StackDoesNotChangeOrder
	|stack sentenceFinder prefix arrayOfSentences collectionOfElements elementValue|
	stack := OOStack new.
	collectionOfElements := #('The winds of Winter' 'Winter Soldier' 'winning is everything' 'winter is coming').
	prefix := 'Wint'. 
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'Winter Soldier'.  
	stack push: 'The winds of Winter'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	arrayOfSentences := sentenceFinder find: prefix.
	1 to: stack size do: [:x | 
		elementValue := stack pop.
		self assert: elementValue equals: (collectionOfElements at: x).
		].! !


!classDefinition: #NullStackElement category: 'Stack-Exercise'!
Object subclass: #NullStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullStackElement methodsFor: 'as yet unclassified' stamp: 'fran 6/7/2021 19:50:49'!
value
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elementOnTop size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'stack management' stamp: 'fran 6/7/2021 19:51:51'!
pop
	| topElementValue nextTopElement |
	topElementValue := elementOnTop value.
	nextTopElement := elementOnTop next.
	elementOnTop := nextTopElement.
	self reduceSize .
	^topElementValue .! !

!OOStack methodsFor: 'stack management' stamp: 'fj 6/6/2021 18:49:41'!
push: anElement
	|newTopElement|
	newTopElement := StackElement with: anElement followedBy: elementOnTop.
	elementOnTop := newTopElement .
	self increaseSize .
	! !


!OOStack methodsFor: 'accessing' stamp: 'fran 6/7/2021 19:46:39'!
isEmpty
	^size = 0.! !

!OOStack methodsFor: 'accessing' stamp: 'fj 6/6/2021 18:42:00'!
size
	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'fran 6/7/2021 19:51:20'!
top
	^elementOnTop value.! !


!OOStack methodsFor: 'initialization' stamp: 'fj 6/6/2021 18:40:57'!
initialize
	elementOnTop := NullStackElement new.
	size := 0.! !


!OOStack methodsFor: 'private' stamp: 'fj 6/6/2021 18:49:08'!
increaseSize.
	size := size +1.
	! !

!OOStack methodsFor: 'private' stamp: 'fj 6/6/2021 18:49:23'!
reduceSize
	size := size -1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 21:45:49'!
InitializeWith: aStack
	stack := aStack.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 23:07:18'!
find: prefix
	|auxiliarStack arrayOfSentences elementValue|
	(prefix = '') ifTrue: [^self error: SentenceFinderByPrefix emptyPrefixIsNotValid].
	(prefix includesSubString: ' ') ifTrue: [^self error: SentenceFinderByPrefix prefixWithBlanckSpaceIsNotValid].
	auxiliarStack := OOStack new.
	arrayOfSentences := OrderedCollection new.
	1 to: stack size do: [:x | 
		elementValue := stack pop.
		(elementValue is: prefix substringAt: 1) ifTrue: [arrayOfSentences add: elementValue ].
		auxiliarStack push: elementValue.
		].
	1 to: auxiliarStack size do: [:x | 
		elementValue := auxiliarStack pop.
		stack push: elementValue.
		].
	^arrayOfSentences.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 22:59:14'!
emptyPrefixIsNotValid
	^'The prefix can not be empty'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 23:08:20'!
prefixWithBlanckSpaceIsNotValid
	^'The prefix can not contain blanck spaces'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 21:46:27'!
with: aStack
	^self new InitializeWith: aStack.
	! !


!classDefinition: #StackElement category: 'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: 'value nextStackElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:40:02'!
initializeWith: anElement followedBy: elementOnTop
	value := anElement.
	nextStackElement := elementOnTop.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:40:35'!
next
	^nextStackElement .! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'fran 6/7/2021 19:49:07'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElement class' category: 'Stack-Exercise'!
StackElement class
	instanceVariableNames: ''!

!StackElement class methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:38:58'!
with: anElement followedBy: elementOnTop.
	^self new initializeWith: anElement followedBy: elementOnTop .! !
