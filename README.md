# Code Curriculum

## Setup

1. Fork this repository.

2. Add @maryrosecook as a collaborator on the repository on GitHub.

3. Make sure you use Ruby version `2.4.1`.  To check your Ruby version, run the command below.

```
$ ruby -v
```

4. If required, use [RVM](https://rvm.io/) to install version `2.4.1`.

5. Install bundler.  To do this, run:

```
$ gem install bundler
```

6. Install the gems required by this repository. To do this, run:

```
$ cd path/to/root/of/this/repo
$ bundle install
```

## Instructions

1. Work through the numbered modules (beginning with `/1_hello_world`).

2. Work through a module.

3. When you've absorbed the content of the module thoroughly, [get the quiz](#get-a-quiz).

4. Complete the quiz.  Instructions [here](#completing-a-quiz).

5. If you get stuck and can't complete a quiz, contact @maryrosecook on Slack and she give you feedback to help you learn what you need to complete the quiz.

6. Once the quiz is complete, continue to the next module.

Your aim is to get through all the modules, but you only move on from a module once you've completed the quiz.

## How to complete a quiz

* Each question is in a separate file e.g. `1_hello_world/quiz1/question_1.rb`.

* A typical question file might look like this:

```ruby
# Write a program that adds 7 to 5, multiplies that by 10, subtracts 2 from all that, divides all that by 4, adds 1,000,000 to all that and `puts`es the result.

# Your answer here.
```

* To answer a question, type code that solves the question into the question file.

* You can run the question file like a normal ruby program `e.g. ruby question_1.rb`.

### 1. Check that your answers pass the automated tests

* To check your answer for a question:

```
$ cd 1_hello_world/quiz1
$ rspec spec/question_1_spec.rb
```

* To check your answers for all the questions in a quiz:

```
$ cd 1_hello_world/quiz1
$ rspec
```

### 2. Commit and push your answers

* Use git to commit and push your answers to your GitHub repo.

### 3. Submit and verify your answers

* [Use the quiz server to submit and verify your answers](#submit-and-verify-quiz-answers).

## Quiz server

### Submit and verify quiz answers

```
$ cd path/to/root/of/repo
$ rake submit_and_verify_quiz_answers github-username module-number
$ (e.g. rake submit_and_verify_quiz_answers timmydev 1)
```

### Get a quiz

* You can only get a quiz after you've successfully submitted and verified answers for the previous quiz.

```
$ cd path/to/root/of/repo
$ rake get_quiz githubusername module-number
$ (e.g. rake get_quiz timmydev 1)
```

## Content overview

#### Important concepts
**important concepts or terminology** are in bold.

#### Exercises and activities
Instructions for you to do something (an activity or exercise) look like this:

* _**An instruction for you**_

#### Activity examples
Activities are usually followed by a guide as to how I'd do it:

<details>
  <summary>See how I'd do it</summary>
  <p>

```
There's usually some code to execute in here. You can't generally copy-paste it though.
```
  </p>
</details>
<p></p>

#### Extensions or tangents

> If something isn't directly related, but might be interesting, provide context, or more information, it'll be in a blockquote (like this).

### Modules

1. [Hello World](./1_hello_world/README.md)
1. [Variables and Statements](./2_variables_and_statements/README.md)
1. [Messages and Interfaces](./3_messages_and_interfaces/README.md)
1. [Other Objects](./4_other_objects/README.md) :construction:
1. [Arrays](./5_arrays/README.md) :construction:
1. [Procedures](./6_procedures/README.md) :construction:
1. [Conditionals](./7_conditionals/README.md) :construction:
1. [:question: Classes :question:](./8_maybe_classes/README.md) :construction:
