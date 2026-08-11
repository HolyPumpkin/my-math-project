# Proof Status: imo_2026_p1

## Problem
IMO 2026 P1 — GCD/LCM blackboard: 2026 integers > 1, replace (m,n) with (gcd(m,n), lcm(m,n)/gcd(m,n)). Prove termination (exactly one M > 1 remains) and invariance (M independent of choices; correct closed form: M = ∏_p p^{gcd_i v_p(a_i)}, the "exponent-gcd number", NOT the numeric gcd).

## Target Contract
- Path: sketch/target_contract.md
- Status: complete

## Phase
complete

## Proof Complete — VERIFIED
- All 9 lemmas verified PASS (score 1)
- Refinement adopted and verified
- proof.pdf exported (5 pages)
- Stop gate: PASS --verified-proof

## History
- [2026-08-10] Workspace initialized. Phase: sketch. Dispatching Sketcher.
- [2026-08-10] Sketcher completed: 9 lemmas, 2-branch DAG. KB-manager query confirmed wiki's "M = gcd" error.
- [2026-08-10] Plan verification PASSED. Phase: prove. All 9 lemmas generated and verified PASS on first attempt.
- [2026-08-10] Refinement adopted and verified PASS. Writer produced final article. Phase: complete.
- 3 minor non-blocking notes (see sketch/logic_verification_report.md)

## Lemma Status
| Lemma | Dependencies | Status | Generator Attempts | Verifier Verdict | Review Packet |
|-------|--------------|--------|--------------------|------------------|---------------|
| lem_gcd_exp_minmax | none (UFD) | verified | 1 | PASS | review_packet_v1.md |
| lem_euclidean_pair_identity | none | verified | 1 | PASS | review_packet_v1.md |
| lem_multiset_gcd_preservation | none | verified | 1 | PASS | review_packet_v1.md |
| lem_lcm_gcd_identity | lem_gcd_exp_minmax | verified | 1 | PASS | review_packet_v1.md |
| lem_move_exponent_dynamics | lem_gcd_exp_minmax, lem_lcm_gcd_identity | verified | 1 | PASS | review_packet_v1.md |
| lem_lex_monovariant_termination | lem_lcm_gcd_identity | verified | 1 | PASS | review_packet_v1.md |
| lem_exponent_gcd_invariant | lem_move_exponent_dynamics, lem_euclidean_pair_identity, lem_multiset_gcd_preservation | verified | 1 | PASS | review_packet_v1.md |
| lem_terminal_valuation_equality | lem_exponent_gcd_invariant, lem_lex_monovariant_termination | verified | 1 | PASS | review_packet_v1.md |
| thm_main_imo2026p1 | lem_lex_monovariant_termination, lem_exponent_gcd_invariant, lem_terminal_valuation_equality | verified | 1 | PASS | review_packet_v1.md |

## Open Proof Obligations
| Obligation | Owner | Source | Status | Next Action |
|------------|-------|--------|--------|-------------|

## Active Branch Queue
| Rank | Branch | Owner | File target | Needed evidence | Status |
|------|--------|-------|-------------|-----------------|--------|
| 1 | direct-elementary | Generator (tier 1 × 3) | lemmas/*/generator/proof_v1.md | 3 lemma proofs verified PASS | active |

## History
- [2026-08-10] Workspace initialized. Phase: sketch. Dispatching Sketcher.
- [2026-08-10] Sketcher completed: 9 lemmas, 2-branch DAG. KB-manager query confirmed wiki's "M = gcd" error. Matlas returned standard textbook identities only.
- [2026-08-10] Plan verification PASSED (score 1). Phase: prove. Dispatching tier-1 Generators (lem_gcd_exp_minmax, lem_euclidean_pair_identity, lem_multiset_gcd_preservation).
