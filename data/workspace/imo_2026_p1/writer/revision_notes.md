# Revision Notes — IMO 2026 Problem 1 (FULL_ARTICLE)

## Output Contract

- Output type: FULL_ARTICLE
- Language: English (research-note/paper register)
- Target file: `writer/article_candidate.tex` (standalone LaTeX, compiles with
  `pdflatex` from `writer/` once `KLMM/` is copied next to it)
- Source files:
  - `data/workspace/imo_2026_p1/problem.md`
  - `data/workspace/imo_2026_p1/proof.tex` (refined proof adopted as
    authoritative; all 9 items VERIFIED PASS)
  - `data/workspace/imo_2026_p1/sketch/research_notes.md`
  - `data/wiki/Source_IMO_2026_Problem_1.md`
- Style: repository KLMM house template (`tex/template.tex`) as the structural
  starting point
- Proof-search allowance: none — mathematics is transcribed from verified
  `proof.tex`, not re-derived
- Citation policy (ADR 0019): `references/` is empty (no `ledger.jsonl`, no
  `refs.bib`). The proof is self-contained elementary number theory; the
  article therefore carries no `\cite` commands and no bibliography. No
  citations were invented; nothing is surfaced to the Orchestrator because no
  load-bearing external result was used.

## Grounding Pass

- All 8 lemmas, the main theorem, and every proof are transcribed from
  `proof.tex` (verified) with the mathematics kept verbatim; only connective
  exposition sentences were added, each restating lemma content.
- Counterexamples in the Remarks section:
  - `(4,8)`: play `(4,8) -> (4,2) -> (2,2) -> (2,1)`, `M = 2 != 4 = gcd(4,8)`
    — from the Remark in `proof.tex`;
  - `(2,3)`: play `(2,3) -> (1,6)`, `M = 6 != 1 = gcd(2,3)` — from
    `sketch/research_notes.md` (direct computation);
  - `(4,8,9)`: `G_2 = gcd(2,3,0) = 1`, `G_3 = gcd(0,0,2) = 2`, `M = 18 != 1 =
    gcd(4,8,9)` — from `sketch/research_notes.md`.
- No `TODO` placeholders anywhere in the prose.

## Review

- Statement preservation: theorem parts (a)/(b) verbatim from `proof.tex`;
  hypotheses unchanged; all 8 lemmas present with unchanged logic; the
  "exponent-gcd number" terminology preserved.
- Notation: `v_p`, the multiset gcd conventions, and `\lcm` are introduced
  before first use in proofs; the theorem statement in Section 2 defines `G_p`
  inline exactly as `proof.tex` does, and Section 3 formalizes the notation.
- The critical Remark (M is NOT the numeric gcd, with counterexamples) is
  included as required.
- No agent/run history, no internal paths, no scheduling details in the prose.
- Article structure deviates from `proof.tex` only in presentation (theorem
  stated up front in a "Statement of the Result" section, lemmas grouped into
  subsections); no mathematical content change.
