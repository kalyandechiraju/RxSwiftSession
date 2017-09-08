/*:
# Reactive Programming
Observing **Streams** of Data, **transforming** them and **binding** the results to some output
#### What is a Stream?
A stream is a sequence of ongoing events ordered in time.

![](stream2.png "Stream")

In iOS: Text Input, Network Requests, Button clicks and many more.
 
 Example: the values emitted by **UISwitch** is a stream of Boolean values.

 ![](uiswitch.png "UISwitch")

 > It can emit three different things: a **value** (of some type), an **error**, or a **completed** signal.

#### What does transformation mean?
What do we do with any Stream of data? We transform each emitted value as per our needs.
Sort, filter, map, insert, split, remove, replace...

![](merge.png "Merging two streams")
 
 
 ![](combineLatest.png "Combining two streams")

#### Binding
 Once you perform certain transformations on the stream, we need to display that result to the user. We can do it with the bindings like setText, setEnabled, setHidden, setImage etc...
> We will see the example for bindings later in our iOS demo
 
 A point to notice:
 > Unless there is atleast one Subscriber, the Observable won't emit any data.
 
 ## Why Reactive Programming?
 > The ReactiveX Observable model allows you to treat streams of asynchronous events with the same sort of simple, composable operations that you use for collections of data items like arrays. It frees you from tangled webs of callbacks, and thereby makes your code more readable and less prone to bugs.
*/

//: [Next](@next)
