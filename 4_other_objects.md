# Other objects

We already know that when we start a Ruby program, some **objects** are made for us.

<gif (from before) demonstarting program starting and some numbers coming into existence: zoom in on the numbers to show they exist>

In [module 2](./2_variables_and_statements.md), we saw that numbers were ready and waiting for us whenever we set up the Ruby world. And, we **assigned** these pre-existent numbers to **variables**: in other words, we gave them programmer-friendly **names**.

In [module 3](./3_messages_and_interfaces.md), we found out that we could instruct objects to do things using **messages**. We learned that the list of messages we can send to an object is called its **interface**. We saw that you could make a good guess at what an object was, based on the **methods** defined on its interface.

So far, we've mostly been working with one type of object: numbers. Numbers are one thing, but what other objects pre-exist in this world?

And how do objects come into being, anyway?

## `CONSTANTS` don't change

Some objects never change. In Ruby, we call these objects **Constants**. There are special rules for assigning names to constants: once we've assigned them, we can't assign them again.

When we start the program world, some constants come into existence automatically. One of these is `RUBY_VERSION`.

* _**Open a REPL, and output the `RUBY_VERSION` constant.**_
* _**Answer this: why isn't `RUBY_VERSION` just called `ruby_version`?**_

<details>
<summary>See how I'd do this</summary>
<p>

```irb
> RUBY_VERSION
=> "2.4.1"
```
</p>
</details>
<p></p>

> To tell Ruby that a particular object should never change (i.e. should be a constant), give it a name starting with a capital letter.

## `Classes` are gods

Right before our universe made the numbers, it made the gods. 

In our program, these gods are called **Classes**. They created all the objects that exist in the program. Each class – each god – is responsible for creating certain kind of objects: 'their' objects.

Just like in myths from Ancient Greece, these 'gods' exist as objects inside the universe, and we can send them messages. Mostly, we send them messages asking them to create new objects in the program world. Objects created by these classes are called **Instances** of that class.

> In Ruby, all classes start with a capital letter, putting them in the same naming category as constants. Why do you think this is? How constant are the gods?

One such 'god-like' object is the `Integer` class. 'Whole numbers', like 1, 2, and 5, are 'instances of the Integer class'.

> We call instances of the `Integer` class 'integers'. 

When we start `irb` and the integers come into existence, they are created by this particular god. How does that happen?

The true answer is complex, but for now we'll take a shortcut: when we want to ask a Ruby class to create an object, we send it the message `new`. So it's reasonable to think that, when the program world starts, Ruby does this sort of thing behind the scenes:

```ruby
1 = Integer.new
#=> 1
2 = Integer.new
#=> 2
3 = Integer.new
#=> 3
# and so on
```

<gif demonstrating calling `new` on Integer and the numbers coming out of it>

> If you try to run the `Integer.new` code above, you'll get an error. Again, the reasons are complex and have to do with the deep-level implementation of Ruby. If you want to learn more, [here's some reading](https://stackoverflow.com/questions/3430280/how-does-object-id-assignment-work). For now, understand we're using `Integer.new` to illustrate how instances are created from classes.

## Creating new objects in the world

We, too, can send the message `new` to these classes. This is how we create new objects: new instances of that class. This process is called **instantiation**.

A good candidate for trying out instantiation is the `String` class. The `String` class creates objects which: 

* Know about some text, and 
* Know how to interact with other instances of the `String` class.

> We call instances of the `String` class 'strings'.

There are many reasons we might want to store strings of text inside our programs. For example: remember the Todo program: 

- We want the user to be able to input text (a 'todo'), and retrieve it later. 
- We might also want to manipulate that text: perhaps, to capitalize it (if the user keeps forgetting to complete the todo).

So, we need an object that stores and can manipulate some text. What better object than an instance of `String`?

* _**Assign to the variable `todo_1` a new instance of `String`, with the text `"wash the dog"`.**_
* _**Send the string referenced by `todo_1` a message to return its text, in uppercase.**_

<details>
<summary>See how I'd do this</summary>
<p>

```irb
> todo_1 = String.new("wash the dog")
=> "wash the dog"
> todo_1.upcase
=> "WASH THE DOG"
```
</p>
</details>
<p></p>

## Different objects, different purposes

Much of Ruby programming is about identifying the right class to create instances for a particular job. To that end, Ruby provides you a wide range of different classes, with different purposes: like `Integer` and `String`.

> In the next module, we'll meet a very useful class: `Array`.

Of course, these classes create instances that have quite different purposes. `Integer` instances understand (whole) numbers, and `String` instances understand text. `Integer` instances (integers) know how to interact with other integers, and `String` instances (strings) know how to interact with other strings.

Let's play around in IRB to demonstrate the difference in their purposes.

* _**Assign to the variable `one_string` a new instance of `String`, with the text `"1"`.**_
* _**Assign to the variable `two_string` a new instance of `String`, with the text `"2"`.**_
* _**Tell `one_string` to return the result of adding itself to `two_string`**_
* _**Explain what happens, and why it's different from the `1 + 2` statement we did with instances of `Integer`.**_

<details>
<summary>See how I'd do this</summary>
<p>

```irb
> one_string = String.new("1")
=> "1"
> two_string = String.new("2")
=> "2"
> one_string + two_string
=> "12"
```
</p>
</details>
<p></p>

> Notice that the interfaces of both instances of `String` and instances of `Integer` define methods for the message `+`. Notice, though, that `+` does quite different things in each case. What happens is specific to the object's purpose, and this is a conscious decision on the part of the program designer. More programmers want to stitch strings together (`"1" + "2"`) than want to add the numbers within those strings. So, Ruby designers chose to make the `+` method do different things for different objects.

## Class and Instance interfaces

Because Classes are different objects to Instances, they have different interfaces. For instance: `String` defines `new` on its interface. When called, `String.new` produces a new instance of `String`. This instance, however, does not define `new` on its interface, because it's not a class and so isn't responsible for creating new instances.

```irb
> string_instance = String.new("some words")
=> "some words"
> string_instance_instance = string_instance.new
=> NoMethodError: undefined method `new' for "some words":String
```

Decomposing that error:

<diagram of error decomposition>

And visually depicting what we're trying to do:

<gif showing calling #new on a class and on an object>

* The methods defined on a class interface are called the `class methods`. 
* The methods defined on an instance interface are called the `instance methods`.

## Printing using the main object

The Main Object is a special kind of instance: an instance of the `Object` class. When we call methods in IRB without addressing a particular object, we're calling them on the Main Object.

- _**Use the `methods` message in IRB to list the methods on the main object.**_
- _**Capture the main object's `object_id`.**_

> Ultimately, all classes are themselves instances of the `Object` class. So if a monotheistic version of the program universe appeals to you, you could think of `Object` as being the 'one true' god entity in Ruby. Obviously, it's not very specialised – so it doesn't create objects that are very useful for us.

One of the useful purposes of the Main Object is to output information from the program. Defined on the interface of instances of `Object` is a method called `puts`. It stands for 'put string'. It can be used to print information from the program:

```irb
> puts String.new("I am being printed out!")
I am being printed out!
=> nil
```

<gif demonstrating the use of `puts`>

## Putting it all together

Let's build out the first part of our Todo app.

- _**Start up IRB.**_
- _**Define variables for three new instances of the `String` class: `todo_1`, `todo_2`, and `todo_3`. Each one should store some text with a todo item.**_
- _**Create a pre-written world containing `todo_1`, `todo_2`, and `todo_3`, then print them immediately.**_

You should be able to run:

```bash
$> irb -r ./todo.rb
```

And immediately see:

```irb
This is todo item 1
This is todo item 2
This is todo item 3
>
```

