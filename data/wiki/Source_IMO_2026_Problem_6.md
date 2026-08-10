---
tags: [source, number-theory, combinatorics]
date: 2026-08-10
source_file: data/raw_sources/b548fac1eb84/IMO-2026-problems-eng.pdf
source_count: 1
---

# IMO 2026 Problem 6 — Sequence Avoiding Coprimes

## Statement

Let $a_1, a_2, a_3, \ldots$ be an infinite sequence of positive integers greater than 1. Suppose that for all positive integers $n$, the number $a_{n+1}$ is the smallest positive integer greater than $a_n$ such that $\gcd(a_{n+1}, a_i) > 1$ for every $i = 1, 2, \ldots, n$. Prove that there exist positive integers $T$ and $L$ such that

$$a_{n+T} = a_n + L$$

for every positive integer $n$.

## Solution Summary

*(Outline as reported; the periodicity proof needs a full formalisation.)*

**Finitely many primes.** Every term $a_n$ with $n \ge 2$ satisfies $\gcd(a_n, a_1) > 1$, so every prime appearing anywhere in the sequence divides $a_1$. Hence only finitely many primes occur.

**Key terms.** Call a term *key* if its set of prime divisors is minimal with respect to inclusion among the sets occurring in the sequence. Since the prime set is finite, there are finitely many subsets of it, hence finitely many key terms.

**Eventual periodicity.** For all sufficiently large $n$, whether a candidate $x > a_n$ shares a factor with every earlier term depends only on the residue of $x$ modulo the product of all relevant primes: the condition "$\gcd(x, a_i) > 1$ for all $i \le n$" is a finite conjunction of divisibility constraints, each periodic with period dividing that product. The greedy choice of $a_{n+1}$ as the least such $x$ above $a_n$ is therefore eventually periodic, yielding positive integers $T, L$ with $a_{n+T} = a_n + L$ for every $n$.

## Key Concepts

- [[Concept_GCD_LCM_Invariants]] — prime-factorisation structure of gcd conditions.
- Dickson's lemma / minimal elements under inclusion on a finite family of subsets.
- Eventual periodicity of a greedy construction; finite-state dynamics.

## Connections

- Shares prime-factorisation invariants with [[Source_IMO_2026_Problem_1]].
- The "finitely many inclusion-minimal patterns" step is the same finiteness principle (Dickson's lemma) used in termination proofs for term-rewriting systems.
- Proposer: IMO 2026 Problem Selection Committee.
