# Messages

Our REPL provides us with a window through which we can interact with the program world. But how does that interaction happen?

### Messages

We interact with the program world by sending it **messages**. In our REPL, we're interacting with the main object.

<gif showing me interacting with the main object by sending it messages>

The main object will then figure out what to do with the message. Here's a visual depiction of us, the programmer, interacting with the REPL by requesting an object by name (`one`). Provided that we have defined this variable, the REPL goes and fetches the object referenced by that name:

<gif showing me interacting with the main object by sending it the message `one` and it figuring out to get me the '1' object>

Now that we have the object referenced by `one`, we can tell it to do things. For instance, we can tell it to add itself to another number:

<gif showing me executing `1 + 2` and the resulting messages that are sent in the world>

Or, we can ask the object referenced by `one` about itself:

<gif showing me executing `1.integer?` and the resulting messages that are sent in the world>

Hold one – there's a difference there.

```ruby
1 + 2
1.integer?
```

In both cases, we're sending messages to objects – but in the first case, we've got a regular-looking sum. In the second case, we've got this crazy dot thing.

## Dot syntax

What might surprise you is that the second way is, secretly, the only way to send messages to objects in Ruby. The `.` (**dot**) means 'tell this object something'. `1.integer?` means "tell the object referenced by 1 to answer if it's an integer or not".

In the first case, `1 + 2`, Ruby is actually translating this to `1.+ 2`. We say 'one plus two', and Ruby translates that to "tell the object referenced by 1 to do addition with two".

It's a subtle distinction, but an important one. 

> Later on, we'll see that being able to tell objects to do things using dot syntax is crucial to interacting with the program. And, even later than this, we'll discover that dot syntax is used by objects to tell each other to do things, too.

- _**Convert your numeral calculator to use dot syntax.**_