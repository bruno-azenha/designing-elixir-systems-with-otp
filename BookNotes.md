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
> - The machinery of processes, message passing and recursion that form the heart of concurrency in Elixir systems.
> - An API of plain functions that hides that machinery from clients

