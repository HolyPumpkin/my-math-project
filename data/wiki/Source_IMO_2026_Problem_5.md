---
tags: [source, functional-equations]
date: 2026-08-10
source_file: data/raw_sources/b548fac1eb84/IMO-2026-problems-eng.pdf
source_count: 1
---

# IMO 2026 Problem 5 — Functional Inequality

## Statement

Let $\mathbb{R}_{>0}$ be the set of positive real numbers. Determine all functions $f : \mathbb{R}_{>0} \to \mathbb{R}_{>0}$ such that

$$\sqrt{\frac{x^2 + f(y)^2}{2}} \;\ge\; \frac{f(x) + y}{2} \;\ge\; \sqrt{x\,f(y)}$$

for every $x, y \in \mathbb{R}_{>0}$.

## Answer

$$f(x) = x + C \qquad \text{for some constant } C \ge 0.$$

## Solution Summary

*(Outline as reported.)*

The chain is the RMS–AM–GM chain applied to the pair $(x, f(y))$:

$$\underbrace{\sqrt{\frac{x^2 + f(y)^2}{2}}}_{\text{RMS}} \;\ge\; \underbrace{\frac{x + f(y)}{2}}_{\text{AM}} \;\ge\; \underbrace{\sqrt{x\,f(y)}}_{\text{GM}},$$

with the arithmetic-mean slot replaced by the crossed pair $(f(x), y)$.

**Classification.** The reported key lemma states that the inequality forces

$$f(x) + y = x + f(y) \qquad \text{for all } x, y > 0,$$

so $f(x) - x$ is constant and $f(x) = x + C$. The condition $C \ge 0$ is exactly what keeps $f$ valued in $\mathbb{R}_{>0}$ for every $x > 0$.

**Verification.** For $f(x) = x + C$ with $C \ge 0$, the middle term becomes $\dfrac{x + y + C}{2}$, and the chain reduces to the genuine RMS–AM–GM inequality for the positive pair $(x, y + C)$, which holds for all $x, y > 0$.

## Key Concepts

- [[Concept_RMS_AM_GM_Inequality]] — RMS ≥ AM ≥ GM and equality-case analysis.
- Functional equations solved by extracting a linearity lemma from an inequality chain.
- Positivity constraints on the codomain ($C \ge 0$).

## Connections

- The chain is a functional-equation variant of the classical RMS–AM–GM inequality; see [[Concept_RMS_AM_GM_Inequality]].
- Proposer: Alfrēds Saročinskis (Latvia). <!-- VERIFY: proposer attribution is web-reported, not stated in the PDF. -->
