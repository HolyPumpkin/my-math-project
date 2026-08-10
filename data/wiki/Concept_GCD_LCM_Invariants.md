---
tags: [concept, number-theory]
date: 2026-08-10
source_count: 1
---

# Concept: GCD/LCM Invariants

## Definition

For positive integers $a_1, \ldots, a_k$, the greatest common divisor and least common multiple factor through prime exponents:

$$v_p(\gcd(a_1, \ldots, a_k)) = \min_i v_p(a_i), \qquad v_p(\operatorname{lcm}(a_1, \ldots, a_k)) = \max_i v_p(a_i),$$

where $v_p$ is the $p$-adic valuation. In particular, $\operatorname{lcm}(m, n) = \dfrac{mn}{\gcd(m, n)}$.

## Key Results

1. **Euclidean-algorithm dynamics (IMO 2026 Problem 1).** The move
   $$(m, n) \mapsto \left(\gcd(m, n),\; \frac{\operatorname{lcm}(m, n)}{\gcd(m, n)}\right)$$
   acts on each exponent pair as $(x, y) \mapsto (\min(x, y),\, |x - y|)$, one subtractive-Euclidean-algorithm step. Consequently the gcd of the $p$-adic valuations over all entries is invariant under every move, and the process terminates with the single entry equal to the gcd of the initial multiset. See [[Source_IMO_2026_Problem_1]].

2. **Prime-support finiteness (IMO 2026 Problem 6).** If every term of a sequence shares a factor with the first term, only finitely many primes occur anywhere. Gcd constraints then become finite conjunctions of periodic divisibility conditions, which turns the greedy construction into an eventually periodic sequence $a_{n+T} = a_n + L$. See [[Source_IMO_2026_Problem_6]].

## Sources

- [[Source_IMO_2026_Problem_1]]
- [[Source_IMO_2026_Problem_6]]

## Connections

- The valuation viewpoint (min/max exponent algebra) is the standard tool for gcd/lcm problems; it converts multiplicative statements into componentwise statements on exponent vectors.
- The same finiteness principle behind Result 2 (finitely many minimal subsets of a finite prime set) is Dickson's lemma, used in termination arguments for term-rewriting systems.
