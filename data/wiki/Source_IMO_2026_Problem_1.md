---
tags: [source, number-theory]
date: 2026-08-10
source_file: data/raw_sources/b548fac1eb84/IMO-2026-problems-eng.pdf
source_count: 1
---

# IMO 2026 Problem 1 — GCD/LCM Blackboard

## Statement

There are 2026 integers greater than 1 written on a blackboard, not necessarily different. In a move, Confucius chooses two integers $m > 1$ and $n > 1$ from different places on the blackboard and replaces these two integers with

$$\gcd(m, n) \quad \text{and} \quad \frac{\operatorname{lcm}(m, n)}{\gcd(m, n)}.$$

He continues to make moves while it is possible to do so.

**(a)** Prove that, regardless of the choices of Confucius, after finitely many moves, exactly one integer $M$ on the blackboard is greater than 1.

**(b)** Prove that the value of $M$ does not depend on the choices of Confucius.

## Solution Summary

*(Outline; the termination and invariance arguments below are fully justified, the framing is kept compact.)*

**Part (a) — termination via a lexicographic monovariant.** Let $P$ be the product of all entries and let $C$ be the number of entries greater than 1. A move replaces $m, n$ by $g = \gcd(m,n)$ and $\operatorname{lcm}(m,n)/g$; since $\operatorname{lcm}(m,n) = mn/g$, the product of the pair changes from $mn$ to $mn/g$, so $P$ is divided by $g$.

- If $g > 1$, then $P$ strictly decreases.
- If $g = 1$, then $P$ is unchanged and the pair becomes $(1, mn)$ with $mn > 1$, so $C$ strictly decreases by 1.

$P$ is always a positive integer and $C \ge 1$ always holds (the new pair contains an entry $> 1$ in both cases). Hence $(P, C)$ descends strictly in lexicographic order and only finitely many moves are possible. A move is possible exactly when $C \ge 2$, so at termination $C = 1$: exactly one integer $M > 1$ remains.

**Part (b) — the value of $M$ is the gcd of the initial entries.** Fix a prime $p$ and let $v_p$ be the $p$-adic valuation. In one move the exponent pair $(v_p(m), v_p(n))$ becomes

$$\left(\min(v_p(m), v_p(n)),\; \left|v_p(m) - v_p(n)\right|\right),$$

which is one step of the subtractive Euclidean algorithm, so the quantity

$$G_p := \gcd_i v_p(a_i)$$

taken over all entries $a_i$ is invariant under every move (a gcd of a multiset is preserved by Euclidean steps on any two of its elements). At termination every entry except $M$ equals 1, so $v_p(M) = G_p$ for every prime $p$, and therefore

$$M = \prod_p p^{G_p} = \gcd(\text{the initial 2026 integers}).$$

This value is determined by the initial multiset alone, so $M$ does not depend on Confucius's choices.

## Key Concepts

- [[Concept_GCD_LCM_Invariants]] — the invariant of per-prime exponent gcds and the Euclidean-algorithm dynamics of the move.
- Monovariant / lexicographic descent arguments for termination.
- $\operatorname{lcm}(m, n) = \dfrac{mn}{\gcd(m, n)}$ and $v_p(\gcd_i a_i) = \min_i v_p(a_i)$.

## Connections

- Shares the valuation/invariant machinery with [[Source_IMO_2026_Problem_6]].
- The exponent move $(x, y) \mapsto (\min(x, y), |x - y|)$ is the subtractive Euclidean algorithm; see [[Concept_GCD_LCM_Invariants]].
- Proposer: Giancarlo Kerg (Luxembourg). <!-- VERIFY: proposer attribution is web-reported, not stated in the PDF. -->
