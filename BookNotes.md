# Designing Elixir Systems with OTP notes

## Chapter 1

> OTP is a library that uses processes and
*layers* to make it easy to build concurrent, self-healing software.

### A Layered Structure

Do Fun Things with Loud, Big Worker-bees

- Data structures
- Functional core
- Tests,
- Boundaries
- Lifecycle
- Workers

> A Boundary Layer is:
>
> - The machinery of processes, message passing and recursion that form the heart of concurrency in Elixir systems.
> - An API of plain functions that hides that machinery from clients

## Chapter 2

One of the benefits of using a library such as `URL` is that string manipulation is O(n)

> Don’t send the data to the functions because that’s slow. Send the functions to the data!

## Chapter 3

There's a really nice note about how even though we only see the final result, there were lots of stumbles on the way.

# Chapter 4

> If a program is a story, functions represent the verbs, a critical part of your vocabulary. Your function arguments are nouns. Programming is about naming things well. Too many programmers are afraid of long names. Usually, that’s a mistake. The best name is as long as it needs to be.

Shape Functions for Composition
Once you have functions with good names, the next step in organizing them
is to shape them for composition. In Elixir, that means pipes. The progression
of good Elixir code often goes something like this:
• Try to string together a pipeline of transformations using |> .
• Fallback to with/1 when you need to embrace failure.
• To shape code that’s difficult to compose, use tokens.



