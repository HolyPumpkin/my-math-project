---
tags: [concept, inequalities]
date: 2026-08-10
source_count: 1
---

# Concept: RMS–AM–GM Inequality

## Definition

For nonnegative reals $x_1, \ldots, x_k$, the root-mean-square, arithmetic mean, and geometric mean satisfy

$$\sqrt{\frac{x_1^2 + \cdots + x_k^2}{k}} \;\ge\; \frac{x_1 + \cdots + x_k}{k} \;\ge\; \sqrt[k]{x_1 \cdots x_k},$$

with equality throughout if and only if all $x_i$ are equal. The two-point case:

$$\sqrt{\frac{x^2 + y^2}{2}} \;\ge\; \frac{x + y}{2} \;\ge\; \sqrt{xy} \qquad (x, y \ge 0).$$

## Key Results

1. **Functional inequality classification (IMO 2026 Problem 5).** [[Source_IMO_2026_Problem_5]] asks for all $f : \mathbb{R}_{>0} \to \mathbb{R}_{>0}$ satisfying the crossed chain
   $$\sqrt{\frac{x^2 + f(y)^2}{2}} \;\ge\; \frac{f(x) + y}{2} \;\ge\; \sqrt{x\,f(y)} \qquad \text{for all } x, y > 0.$$
   The solutions are exactly $f(x) = x + C$ with $C \ge 0$; substituting $y + C$ in the genuine chain makes the crossed chain a true RMS–AM–GM statement.

2. **Extraction lemma (reported route).** The solution derives the linearity lemma $f(x) + y = x + f(y)$ for all $x, y > 0$ from the chain, which forces $f(x) = x + C$; the constraint $C \ge 0$ comes from $f$ being valued in $\mathbb{R}_{>0}$.

## Sources

- [[Source_IMO_2026_Problem_5]]

## Connections

- RMS–AM–GM is a special case of power-mean comparisons ($\ell^p$-norm monotonicity); the crossed-chain form used here is a functional-equation variant where the middle term mixes the two arguments.
