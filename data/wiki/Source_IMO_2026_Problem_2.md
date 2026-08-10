---
tags: [source, geometry]
date: 2026-08-10
source_file: data/raw_sources/b548fac1eb84/IMO-2026-problems-eng.pdf
source_count: 1
---

# IMO 2026 Problem 2 — Midpoint Geometry

## Statement

Let $ABC$ be a triangle and let points $M$ and $N$ be the midpoints of sides $AB$ and $AC$, respectively. Let points $K$ and $L$ be chosen strictly inside triangles $BMC$ and $BNC$, respectively, such that $K$ lies strictly inside triangle $ABL$ and $L$ lies strictly inside triangle $AKC$. Suppose that

$$\angle KBA = \angle ACL, \qquad \angle LBK = \angle LNC, \qquad \angle LCK = \angle BMK.$$

Let $O$ be the circumcentre of triangle $AKL$. Prove that $OM = ON$.

## Solution Summary

*(Outline as reported; the geometry needs a full write-up to be formalised.)*

The three angle equalities force three cyclic quadrilaterals. Extend $BK$ and $CL$ to meet $AC$ and $AB$ at points $Y$ and $X$, respectively. Then:

- $B, C, Y, X$ are concyclic (circle $\Omega_1$);
- $B, L, N, Y$ are concyclic (circle $\Omega_2$);
- $C, K, M, X$ are concyclic (circle $\Omega_3$).

The centre of $\Omega_1$ is the antipode of $A$ on the circumcircle of $AKL$. A homothety of factor $1/2$ centred at $A$ (equivalently factor $2$ centred at $O$) maps the perpendicular-bisector structure of the configuration to itself; because $M$ and $N$ are the midpoints of $AB$ and $AC$, this reduction makes the two radii $OM$ and $ON$ equal.

<!-- VERIFY: the homothety step of the outline is asserted at sketch level; the precise image of the perpendicular bisectors under the factor-2 homothety at O should be checked against a full solution before this card is used as a proof. -->

## Key Concepts

- [[Concept_Cyclic_Quadrilaterals]] — angle equalities converted into concyclicity.
- Circumcentre and perpendicular bisectors.
- Homothety (factor $1/2$ at $A$, factor $2$ at $O$).
- Midpoint configurations reducing $OM = ON$ to a symmetry statement.

## Connections

- Classic olympiad-geometry pattern: angle chasing to concyclicity, then a metric conclusion via homothety or similarity.
- Proposer: Mykhailo Shtandenko (Ukraine). <!-- VERIFY: proposer attribution is web-reported, not stated in the PDF. -->
