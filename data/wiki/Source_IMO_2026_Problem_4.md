---
tags: [source, game-theory, geometry]
date: 2026-08-10
source_file: data/raw_sources/b548fac1eb84/IMO-2026-problems-eng.pdf
source_count: 1
---

# IMO 2026 Problem 4 — Mulan's Triangle Game

## Statement

Shan-Yu and Mulan are playing a game. Let $\theta$ be an angle with $0^\circ < \theta < 180^\circ$ known to both players. Initially, Shan-Yu makes a paper triangle $T$ with measurements of his choice. Then, they repeatedly perform the following steps:

- If $T$ has at least one angle measuring exactly $\theta$, then the game stops and Mulan wins.
- Otherwise, Mulan chooses a point $P$ on the perimeter of $T$, different from its three vertices. She then makes a straight cut from $P$ to the opposite vertex of $T$, splitting it into two triangles.
- Shan-Yu discards one of the two triangles. The remaining triangle becomes the new $T$.

For which real values of $\theta$ can Mulan guarantee her victory in finitely many steps, no matter how Shan-Yu plays?

## Answer

Mulan can guarantee victory exactly for

$$\theta = \frac{180^\circ}{n} \qquad (n \ge 2 \text{ an integer}),$$

i.e. $90^\circ, 60^\circ, 45^\circ, 36^\circ, 30^\circ, \ldots$

## Solution Summary

*(Outline as reported.)*

**Mulan wins for $\theta = 180^\circ/n$.** Mulan repeatedly splits an angle that is a multiple of $\theta$: she cuts from a perimeter point to the opposite vertex so that one of the two resulting pieces retains a multiple of $\theta$ while the other does not. Shan-Yu is forced to keep the piece that is not a multiple of $\theta$ (discarding the alternative cannot avoid $\theta$ forever), which strictly decreases the multiple until it reaches $2\theta$; splitting a $2\theta$ angle produces two $\theta$ angles, and Shan-Yu cannot discard both, so the game stops with a $\theta$ angle.

**Shan-Yu denies Mulan for other $\theta$.** If $\theta$ is not of the form $180^\circ/n$, Shan-Yu starts with a triangle none of whose angles is a multiple of $\theta$ and always discards any piece containing an angle that is a multiple of $\theta$. Such a piece exists as long as play proceeds, so a $\theta$ angle is never produced.

## Key Concepts

- [[Concept_Guarantee_Games]] — full-information guarantee games; forcing versus obstruction strategies.
- Angle splitting by a straight cut from a perimeter point to the opposite vertex, with angle-sum bookkeeping in the two resulting triangles.
- The divisibility structure of $180^\circ$: $\theta$ must be a rational divisor of the straight angle.

## Connections

- Shares the guarantee-game framework with [[Source_IMO_2026_Problem_3]].
- The descent through angle multiples of $\theta$ is a measure-descent argument of the kind catalogued under [[Concept_Guarantee_Games]].
- Proposer: Valentin Imbach (Switzerland). <!-- VERIFY: proposer attribution is web-reported, not stated in the PDF. -->
