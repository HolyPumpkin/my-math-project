---
tags: [concept, game-theory, combinatorics]
date: 2026-08-10
source_count: 1
---

# Concept: Guarantee Games

## Definition

A *guarantee game* is a two-player game with perfect information in which the question is a guarantee: which lower bound on a payoff can a specified player enforce regardless of the opponent's play? A complete solution has two halves:

- a **player strategy** proving the lower bound (an explicit construction, with an invariant showing the opponent cannot break it), and
- an **opponent obstruction** proving the upper bound (an opponent response that keeps the payoff below any larger value).

## Key Results

1. **Stick-division game (IMO 2026 Problem 3).** Liu (first) marks at most $n$ points, Xiang (second) marks at most $n$ points, then they alternate claiming pieces of a unit stick. The guaranteed value is
   $$c = \frac{2^n}{2^{n+1} - 1}.$$
   Liu achieves it by partitioning into segments of lengths $\delta, 2\delta, \ldots, 2^n\delta$ with $\delta = 1/(2^{n+1}-1)$; Xiang's pigeonhole argument over subset sums of the pieces caps the guarantee at the same value. See [[Source_IMO_2026_Problem_3]].

2. **Triangle-splitting game (IMO 2026 Problem 4).** Mulan cuts a triangle along a segment from a perimeter point to the opposite vertex; Shan-Yu discards one of the two resulting triangles; Mulan wins once a triangle has an angle exactly $\theta$. Mulan can force a win exactly when $\theta = 180^\circ/n$ for an integer $n \ge 2$: her strategy descends through angles that are multiples of $\theta$, while for all other $\theta$ Shan-Yu's discard strategy keeps every angle a non-multiple of $\theta$. See [[Source_IMO_2026_Problem_4]].

## Sources

- [[Source_IMO_2026_Problem_3]]
- [[Source_IMO_2026_Problem_4]]

## Connections

- The strategy/obstruction dichotomy is the game-theoretic analogue of matching lower and upper bounds in extremal combinatorics.
- Both exemplars terminate finitely and are solved by explicit forcing strategies plus obstruction bounds; the pattern transfers to other "cut and choose" games.
