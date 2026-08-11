# Article Plan — IMO 2026 Problem 1 (GCD/LCM Blackboard)

## Main Theorem

IMO 2026 Problem 1: for a blackboard of 2026 integers > 1, the move
`(m, n) -> (gcd(m, n), lcm(m, n)/gcd(m, n))`:
- (a) every play terminates after finitely many moves with exactly one entry
  `M > 1` on the board;
- (b) `M` is independent of the choices; explicitly `M = prod_p p^{G_p}`
  where `G_p = gcd_i v_p(a_i)` is the gcd of the p-adic valuations of the
  initial entries (the "exponent-gcd number" of the initial multiset).

## Motivation

A blackboard game whose single move, read prime by prime, is one subtractive
Euclidean step on the exponent pair `(x, y) -> (min(x, y), |x - y|)`.
Termination comes from the lexicographic monovariant `(P, C)` (product, count
of entries > 1); the value of `M` comes from the per-prime invariant `G_p`.

## Notation

- `v_p(n)`: p-adic valuation; unique factorization `n = prod_p p^{v_p(n)}`.
- Multiset gcd conventions: `gcd(empty) = 0`, `gcd(0, 0) = 0`, `gcd(x, 0) = x`.

## Proof Idea

- (a) `P` is divided by `g = gcd(m, n)` when `g > 1`; `C` drops by exactly 1
  when `g = 1`; hence `(P, C)` descends strictly in lexicographic order and
  play stops exactly at `C = 1`.
- (b) `G_p = gcd{v_p(a)}` is invariant (`gcd(x, y) = gcd(min(x, y), |x - y|)`
  plus multiset gcd preservation); at the terminal board
  `v_p(M) = G_p`, so `M = prod_p p^{G_p}`.

## Technical Lemmas (8, from proof.tex)

1. Exponent formulas for gcd and lcm (`v_p(gcd) = min`, `v_p(lcm) = max`).
2. Identity `lcm(m, n) * gcd(m, n) = m n`; product change; new pair has an
   entry > 1.
3. Per-prime exponent dynamics of a move.
4. Euclidean step identity `gcd(x, y) = gcd(min(x, y), |x - y|)`.
5. Multiset gcd preservation.
6. Exponent-gcd invariant (part (b)).
7. Termination (part (a)): (i) C >= 1, never increases; (ii) (P, C) strictly
   decreases lexicographically; (iii) at most `(k-1) + floor(log_2 P_0)`
   moves; (iv) terminal board has exactly one entry > 1.
8. Terminal valuation equality `v_p(M) = G_p`.

## Final Proof Route

Theorem 1 assembled from Lemmas 6, 7, 8 (invariant + termination + terminal
valuation), exactly as in `proof.tex`.

## Remarks

- Critical remark: `M` is NOT the numeric gcd of the initial entries
  (`min_i v_p(a_i)` vs `gcd_i v_p(a_i)`), with counterexamples (4, 8), (2, 3),
  (4, 8, 9).
- Remark on the move bound depending on the initial product `P_0`.

## Citation Obligations

None. `references/` is empty; the proof is self-contained. No bibliography in
the article.
