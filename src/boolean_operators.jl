
import Base: nand, nor, xor

"""
    ¬p
    ¬(p)
    not(p)

Logical "negation" operator.

```¬``` can be typed by ```\\neg<tab>```.

See also [`Not`](@ref).

# Examples
```jldoctest
julia> @truth_table ¬p
┌───────────┬─────────┐
│ p         │ ¬p      │
│ Primitive │ Literal │
│ "p"       │         │
├───────────┼─────────┤
│ ⊤         │ ⊥       │
│ ⊥         │ ⊤       │
└───────────┴─────────┘
```
"""
function not end
const ¬ = not
¬p = Not()(p)

"""
    p ∧ q
    ∧(p, q)
    and(p::Language, q::Language)

Logical "conjunction" operator.

```∧``` can be typed by ```\\wedge<tab>```.

See also [`And`](@ref).

# Examples
```jldoctest
julia> @truth_table p ∧ q
┌───────────┬───────────┬───────────────┐
│ p         │ q         │ p ∧ q         │
│ Primitive │ Primitive │ Propositional │
│ "p"       │ "q"       │               │
├───────────┼───────────┼───────────────┤
│ ⊤         │ ⊤         │ ⊤             │
│ ⊤         │ ⊥         │ ⊥             │
├───────────┼───────────┼───────────────┤
│ ⊥         │ ⊤         │ ⊥             │
│ ⊥         │ ⊥         │ ⊥             │
└───────────┴───────────┴───────────────┘
```
"""
function and end
const ∧ = and
p ∧ q = And()(p, q)

"""
    p ⊼ q
    ⊼(p, q)
    nand(p, q)

Logical "non-conjunction" operator.

```⊼``` can be typed by ```\\nand<tab>```.

# Examples
```jldoctest
julia> @truth_table p ⊼ q
┌───────────┬───────────┬───────────────┐
│ p         │ q         │ p ⊼ q         │
│ Primitive │ Primitive │ Propositional │
│ "p"       │ "q"       │               │
├───────────┼───────────┼───────────────┤
│ ⊤         │ ⊤         │ ⊥             │
│ ⊤         │ ⊥         │ ⊤             │
├───────────┼───────────┼───────────────┤
│ ⊥         │ ⊤         │ ⊤             │
│ ⊥         │ ⊥         │ ⊤             │
└───────────┴───────────┴───────────────┘
```
"""
nand(p, q) = ¬(p ∧ q)

"""
    p ⊽ q
    ⊽(p, q)
    nor(p, q)

Logical "non-disjunction" operator.

```⊽``` can be typed by ```\\nor<tab>```.

# Examples
```jldoctest
julia> @truth_table p ⊽ q
┌───────────┬───────────┬───────────────┐
│ p         │ q         │ p ⊽ q         │
│ Primitive │ Primitive │ Propositional │
│ "p"       │ "q"       │               │
├───────────┼───────────┼───────────────┤
│ ⊤         │ ⊤         │ ⊥             │
│ ⊤         │ ⊥         │ ⊥             │
├───────────┼───────────┼───────────────┤
│ ⊥         │ ⊤         │ ⊥             │
│ ⊥         │ ⊥         │ ⊤             │
└───────────┴───────────┴───────────────┘
```
"""
nor(p, q) = ¬p ∧ ¬q

"""
    p ∨ q
    ∨(p, q)
    or(p, q)

Logical "disjunction" operator.

```∨``` can be typed by ```\\vee<tab>```.

# Examples
```jldoctest
julia> @truth_table p ∨ q
┌───────────┬───────────┬───────────────┐
│ p         │ q         │ p ∨ q         │
│ Primitive │ Primitive │ Propositional │
│ "p"       │ "q"       │               │
├───────────┼───────────┼───────────────┤
│ ⊤         │ ⊤         │ ⊤             │
│ ⊤         │ ⊥         │ ⊤             │
├───────────┼───────────┼───────────────┤
│ ⊥         │ ⊤         │ ⊤             │
│ ⊥         │ ⊥         │ ⊥             │
└───────────┴───────────┴───────────────┘
```
"""
function or end
const ∨ = or
p ∨ q = ¬(p ⊽ q)

"""
    p ⊻ q
    ⊻(p, q)
    xor(p, q)

Logical "exclusive disjunction" operator.

```⊻``` can be typed by ```\\xor<tab>```.

# Examples
```jldoctest
julia> @truth_table p ⊻ q
┌───────────┬───────────┬───────────────┐
│ p         │ q         │ p ⊻ q         │
│ Primitive │ Primitive │ Propositional │
│ "p"       │ "q"       │               │
├───────────┼───────────┼───────────────┤
│ ⊤         │ ⊤         │ ⊥             │
│ ⊤         │ ⊥         │ ⊤             │
├───────────┼───────────┼───────────────┤
│ ⊥         │ ⊤         │ ⊤             │
│ ⊥         │ ⊥         │ ⊥             │
└───────────┴───────────┴───────────────┘
```
"""
xor(p, q) = (p ∨ q) ∧ (p ⊼ q)

"""
    p ↔ q
    ↔(p, q)
    xnor(p, q)

Logical "exclusive non-disjunction" and "bi-directional implication" operator.

```↔``` can be typed by ```\\leftrightarrow<tab>```.

# Examples
```jldoctest
julia> @truth_table p ↔ q
┌───────────┬───────────┬───────────────┐
│ p         │ q         │ p ↔ q         │
│ Primitive │ Primitive │ Propositional │
│ "p"       │ "q"       │               │
├───────────┼───────────┼───────────────┤
│ ⊤         │ ⊤         │ ⊤             │
│ ⊤         │ ⊥         │ ⊥             │
├───────────┼───────────┼───────────────┤
│ ⊥         │ ⊤         │ ⊥             │
│ ⊥         │ ⊥         │ ⊤             │
└───────────┴───────────┴───────────────┘
```
"""
function xnor end
const ↔ = xnor
p ↔ q = (p → q) ∧ (p ← q)

"""
    p → q
    →(p, q)
    if_then(p, q)

Logical "implication" operator.

```→``` can be typed by ```\\rightarrow<tab>```.

# Examples
```jldoctest
julia> @truth_table p → q
┌───────────┬───────────┬───────────────┐
│ p         │ q         │ p → q         │
│ Primitive │ Primitive │ Propositional │
│ "p"       │ "q"       │               │
├───────────┼───────────┼───────────────┤
│ ⊤         │ ⊤         │ ⊤             │
│ ⊤         │ ⊥         │ ⊥             │
├───────────┼───────────┼───────────────┤
│ ⊥         │ ⊤         │ ⊤             │
│ ⊥         │ ⊥         │ ⊤             │
└───────────┴───────────┴───────────────┘
```
"""
function if_then end
const → = if_then
p → q = ¬(p ∧ ¬q)

"""
    p ↛ q
    ↛(p, q)
    not_if_then(p, q)

Logical "non-implication" operator.

```↛``` can be typed by ```\\nrightarrow<tab>```.

# Examples
```jldoctest
julia> @truth_table p ↛ q
┌───────────┬───────────┬───────────────┐
│ p         │ q         │ p ↛ q         │
│ Primitive │ Primitive │ Propositional │
│ "p"       │ "q"       │               │
├───────────┼───────────┼───────────────┤
│ ⊤         │ ⊤         │ ⊥             │
│ ⊤         │ ⊥         │ ⊤             │
├───────────┼───────────┼───────────────┤
│ ⊥         │ ⊤         │ ⊥             │
│ ⊥         │ ⊥         │ ⊥             │
└───────────┴───────────┴───────────────┘
```
"""
function not_if_then end
const ↛ = not_if_then
p ↛ q = p ∧ ¬q

"""
    p ← q
    ←(p, q)
    then_if(p, q)

Logical "converse implication" operator.

```←``` can be typed by ```\\leftarrow<tab>```.

# Examples
```jldoctest
julia> @truth_table p ← q
┌───────────┬───────────┬───────────────┐
│ p         │ q         │ p ← q         │
│ Primitive │ Primitive │ Propositional │
│ "p"       │ "q"       │               │
├───────────┼───────────┼───────────────┤
│ ⊤         │ ⊤         │ ⊤             │
│ ⊤         │ ⊥         │ ⊤             │
├───────────┼───────────┼───────────────┤
│ ⊥         │ ⊤         │ ⊥             │
│ ⊥         │ ⊥         │ ⊤             │
└───────────┴───────────┴───────────────┘
```
"""
function then_if end
const ← = then_if
p ← q = ¬(¬p ∧ q)

"""
    p ↚ q
    ↚(p, q)
    not_then_if(p, q)

Logical "converse non-implication" operator.

```↚``` can be typed by ```\\nleftarrow<tab>```.

# Examples
```jldoctest
julia> @truth_table p ↚ q
┌───────────┬───────────┬───────────────┐
│ p         │ q         │ p ↚ q         │
│ Primitive │ Primitive │ Propositional │
│ "p"       │ "q"       │               │
├───────────┼───────────┼───────────────┤
│ ⊤         │ ⊤         │ ⊥             │
│ ⊤         │ ⊥         │ ⊥             │
├───────────┼───────────┼───────────────┤
│ ⊥         │ ⊤         │ ⊤             │
│ ⊥         │ ⊥         │ ⊥             │
└───────────┴───────────┴───────────────┘
```
"""
function not_then_if end
const ↚ = not_then_if
p ↚ q = ¬p ∧ q

Normal(::typeof(∧), p::Language) = Normal(And(), p)
Normal(::typeof(∨), p::Language) = Normal(Or(), p)
