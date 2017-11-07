# Other objects

We already know that when we start a Ruby program, some objects are made for us.

<gif (from before) demonstarting program starting and some numbers coming into existence: zoom in on the numbers to show they exist>

In [module 2](./2_variables_and_statements.md), we saw that numbers were ready and waiting for us whenever we set up the Ruby world. And, we assigned these pre-existent numbers to variables: in other words, we gave them programmer-friendly names.

Numbers are one thing, but what other objects pre-exist in this world? And how do they come into being?

## _Constants_ don't change

Some objects never change. In Ruby, we call these objects **Constants**. Constants are like regular names, with one exception: once we've assigned them, we can't assign them again.

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

## _Classes_ are gods

Before there were numbers, there were the gods. Just like in our (depending on disposition) universe, these gods were responsible for creating all the objects that exist. And, they continue to be the main mechanism whereby new objects come into existence. Each god is responsible for creating a certain kind of object: 'their' object.

Just like in our (now mythically-embellished) universe, these 'gods' exist as objects inside the universe: and we can talk with them. In Ruby, these gods are called **Classes**. Objects these classes create are called **Instances** of that class.

> In Ruby, all classes start with a capital letter, putting them in the same naming category as constants. Why do you think this is? How constant are the gods?

One such 'god-like' object is the `Integer` class. 'Whole numbers', like 1, 2, and 5, are 'instances of the Integer class'. When we start `irb` and the numbers come into existence, they are created by this particular god. How does that happen?

The true answer is complex, but for now we'll take a shortcut: when we want to ask a Ruby class to create an object, we send it the message `new`. So it's reasonable to think that, when the program world starts, Ruby does this sort of thing behind the scenes:

```ruby
1 = Integer.new
2 = Integer.new
3 = Integer.new
# and so on
```

<gif demonstrating calling `new` on Integer and the numbers coming out of it>

> If you try to run the `Integer.new` code above, you'll get an error. Again, the reasons are complex and have to do with the deep-level implementation of Ruby. If you want to learn more, [here's some reading](https://stackoverflow.com/questions/3430280/how-does-object-id-assignment-work). For now, understand we're using `Integer.new` to illustrate how instances are created from classes.

## Creating new objects in the world

We, too, can send the message `new` to these classes. This is how we create new objects. A good candidate for trying this out with is the `String` class. Recall that an object is a program entity that:

* Knows something about itself, and
* Knows how to interact with other objects.

The `String` class creates objects which: 

* Know about some text, and 
* Know how to interact with other instances of `String`.

> Somewhat frustratingly, we call instances of the `String` class 'strings'.

For our todo app to work as advertised, we're going to need to store some text. We might even want to change that text around – perhaps capitalizing it if the user forgot to do so. So, we need an object that stores and can manipulate some text. What better object than an instance of `String`?

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

Much of Ruby programming is about identifying the right class of object for a particular job. To that end, Ruby provides you some pretty multi-purpose classes, like `Integer` and `String`. Of course, they're quite different kinds of things. One understands (whole) numbers, and the other understands text. One knows how to interact with other numbers, the other knows how to interact with other text.

So what happens if we get them confused?

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

> There's one god to rule them all, though: `Object`. Ultimately, all classes are themselves instances of the `Object` class. Even the `main` object is an instance of the Object class. So if a monotheistic version of the program universe appeals to you, you could think of `Object` as being the 'one true' god entity in Ruby. Obviously, it's not very specialised – so it doesn't create objects that are very useful for us.

