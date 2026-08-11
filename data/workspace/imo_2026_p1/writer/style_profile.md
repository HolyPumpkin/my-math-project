# Style Profile — IMO 2026 Problem 1 (FULL_ARTICLE)

Language: English
Register: research note / paper
Format: LaTeX — repository KLMM house style (`tex/template.tex` structural
  starting point; `\usepackage[]{KLMM/klmm}`; no bibliography since
  `references/` is empty)
Audience: mathematician familiar with the general area, not with the run
  history
Structure: theorem/proof centered —
  1. Introduction (problem statement, main result, overview/intuition)
  2. Statement of the Result (Theorem, stated up front)
  3. Notation and Preliminaries (v_p, unique factorization, multiset gcd
     conventions)
  4. Main Argument (8 lemmas, grouped: arithmetic of a move; invariants;
     termination; terminal valuation)
  5. Proof of the Main Theorem
  6. Remarks (critical remark with counterexamples; move-bound remark)
Notation: introduced before use; preserves accepted symbols from `proof.tex`
  (`v_p`, `G_p`, `P`, `C`, `lcm`, "exponent-gcd number")
Citations: none — `references/` empty; no load-bearing or background citations
Exposition: intuition separated from formal proof (overview paragraph in the
  Introduction; formal proofs verbatim from the verified source)
Forbidden: agent history, scheduling details, internal path lists, blog tone
