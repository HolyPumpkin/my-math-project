---
tags: [index]
date: 2026-06-15
---

# KBManager Wiki Index

This index is the navigation map for the mathematical card graph. Each entry should be a wikilink plus a one-line summary explaining its mathematical role.

## Source (`Source_*`)

External references compiled into reusable definitions, statements, hypotheses, proof ideas, examples, remarks, and bibliography.

- [[Source_IMO_2026_Problems]] — Official English problem set of IMO 2026 (Shanghai, 15–16 July 2026); six problems spanning number theory, geometry, game theory, and functional equations.
- [[Source_IMO_2026_Problem_1]] — GCD/LCM blackboard move; after finitely many moves exactly one entry > 1 remains, equal to the gcd of the initial entries.
- [[Source_IMO_2026_Problem_2]] — Midpoint geometry; the angle equalities force cyclic quadrilaterals and yield OM = ON.
- [[Source_IMO_2026_Problem_3]] — Stick-division game; Liu's guaranteed value is 2^n/(2^(n+1) − 1).
- [[Source_IMO_2026_Problem_4]] — Triangle-splitting game; Mulan can force a win exactly when theta = 180°/n for integer n ≥ 2.
- [[Source_IMO_2026_Problem_5]] — Functional inequality; all solutions are f(x) = x + C with C ≥ 0, via the RMS–AM–GM chain.
- [[Source_IMO_2026_Problem_6]] — Greedy coprime-avoiding sequence; eventually periodic with period T and shift L.

## Concept (`Concept_*`)

Cross-source mathematical objects collecting definitions, variants, dependencies, related results, examples, and warnings.

- [[Concept_GCD_LCM_Invariants]] — p-adic valuation invariants under gcd/lcm operations; powers Euclidean-algorithm termination (P1) and eventual-periodicity arguments (P6).
- [[Concept_Cyclic_Quadrilaterals]] — concyclicity via angle equalities; the engine of the IMO 2026 P2 midpoint geometry.
- [[Concept_RMS_AM_GM_Inequality]] — RMS ≥ AM ≥ GM chain and its crossed functional-equation variant in IMO 2026 P5.
- [[Concept_Guarantee_Games]] — games where one player guarantees a payoff bound; player strategy vs opponent obstruction (IMO 2026 P3, P4).

## Analysis (`Analysis_*`)

Reusable reasoning lessons such as proof patterns, verifier feedback, missing hypotheses, checklists, and false shortcuts.

## PartialProof (`PartialProof_*`)

Reusable partial progress assets: intermediate statements, reductions, partial routes, dependencies used, remaining gaps, and repair directions.

## Obstruction (`Obstruction_*`)

Falsified path constraints: ruled-out assumptions, invalid shortcuts, incompatible definitions, counterexample signals, circular dependencies, or impossible precondition audits.

## Lean (`Lean_*`)

Formal proof artifacts recording Lean declarations, type signatures, imports, namespaces, docstrings, and proof status.
