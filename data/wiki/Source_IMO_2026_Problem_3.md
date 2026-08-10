---
tags: [source, game-theory, combinatorics]
date: 2026-08-10
source_file: data/raw_sources/b548fac1eb84/IMO-2026-problems-eng.pdf
source_count: 1
---

# IMO 2026 Problem 3 — Liu Bang and Xiang Yu Stick Game

## Statement

Let $n$ be a positive integer. Liu Bang and Xiang Yu have a stick of length 1 and want to divide it between themselves. Liu marks at most $n$ points on the stick, and then Xiang marks at most $n$ points on the stick. The marked points are distinct. Then, the stick is cut at all marked points, creating a number of pieces. Afterwards, they take turns claiming any unclaimed piece of the stick, with Liu going first. Each player's goal is to maximise the total length of their own pieces.

For each $n$, determine the largest value $c$ such that Liu may guarantee a total length of at least $c$, regardless of Xiang's play.

## Answer

$$c = \frac{2^n}{2^{n+1} - 1}.$$

## Solution Summary

*(Outline as reported; a full proof should pin down the exact claiming strategy and the pigeonhole pairing.)*

**Liu's lower bound.** Liu marks $n$ points so that the stick is partitioned into $n+1$ segments whose lengths form a geometric progression

$$\delta,\; 2\delta,\; 4\delta,\; \ldots,\; 2^{n}\delta, \qquad \text{where} \quad \delta = \frac{1}{2^{n+1} - 1}.$$

Under optimal alternating claiming, Liu secures the sum of the odd-indexed pieces, which equals $2^n \delta = 2^n/(2^{n+1} - 1)$.

**Xiang's upper bound.** Xiang uses a pigeonhole argument over the $2^{n+1}$ subset sums of the $n+1$ piece lengths (each in $[0,1]$): two of them must differ by at most $\delta$. This lets Xiang create equal-length pairs of pieces and secure at least half of the remaining length, so Liu cannot guarantee more than $2^n/(2^{n+1} - 1)$.

## Key Concepts

- [[Concept_Guarantee_Games]] — guarantee games: player strategy (lower bound) versus opponent obstruction (upper bound).
- Pigeonhole principle over subset sums.
- Geometric-progression partitions and alternating-sum identities.

## Connections

- Shares the guarantee-game framework with [[Source_IMO_2026_Problem_4]].
- The subset-sum pigeonhole is a standard density argument; it also appears in discrepancy arguments ("two subset sums are close").
- Proposer: IMO 2026 Problem Selection Committee.
