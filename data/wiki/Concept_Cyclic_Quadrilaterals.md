---
tags: [concept, geometry]
date: 2026-08-10
source_count: 1
---

# Concept: Cyclic Quadrilaterals

## Definition

Four points $A, B, C, D$ are concyclic (lie on one circle) if and only if their opposite angles are supplementary:

$$\angle ABC + \angle CDA = 180^\circ.$$

Equivalently, angles subtending the same chord are equal: for points $X, Y$ on the same side of a chord $AB$, one has

$$\angle AXB = \angle AYB \iff X, Y, A, B \text{ are concyclic}.$$

## Key Results

1. **Angle equality $\Rightarrow$ concyclicity (IMO 2026 Problem 2).** In the midpoint configuration of [[Source_IMO_2026_Problem_2]], the equalities $\angle KBA = \angle ACL$, $\angle LBK = \angle LNC$, $\angle LCK = \angle BMK$ translate into three cyclic quadrilaterals: after extending $BK$ and $CL$ to meet $AC$ and $AB$ at $Y$ and $X$, the sets $\{B, C, Y, X\}$, $\{B, L, N, Y\}$, and $\{C, K, M, X\}$ are each concyclic (circles $\Omega_1, \Omega_2, \Omega_3$).

2. **Antipode fact (sketch level).** The centre of $\Omega_1$ in that configuration is the antipode of $A$ on the circumcircle of $AKL$; the circle-centre structure is then combined with a homothety of factor $1/2$ centred at $A$ to conclude $OM = ON$.

## Sources

- [[Source_IMO_2026_Problem_2]]

## Connections

- Standard angle-chasing engine for olympiad geometry: angle equalities are converted into concyclicity, then into statements about circle centres and perpendicular bisectors, and finally into metric conclusions via similarity or homothety.
