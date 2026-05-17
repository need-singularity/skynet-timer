#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# .tape v1.2 — grammar primer (cold-read by any LLM / agent / human)
# ══════════════════════════════════════════════════════════════════════
# Form: each entry is `@<type> <id> := "<subject>" :: <kind> [<grades>]`
#       optionally followed by body lines (2-space indent) — key=value,
#       edges (<- -> => …), or quoted prose.
#
# ENTRY TYPES (17):
#   Runtime (10): @S session  @U user  @A assistant  @T tool-call  @R result
#                 @H hook  @D decision  @K cost  @P provider  @? anomaly
#   Foundation:   @I identity-claim
#   Declarative:  @X external-citation  @F forbidden-pattern  @N note
#                 @C config  @L layout  @V spec-version
#
# EDGES (12, on body lines, 2-space indent):
#   Causal:     <- caused-by   -> triggers   == continues
#               ~> supersedes  !! aborts     |> verified-by
#   Effect:     => produces (followed by quoted natural-language)
#   Structural: <: specializes  :> generalizes  ?> soft-depends
#               !> conflicts-with  @> projects-to (e.g. @> AGENTS.md)
#
# GRADE TAGS (in [...] on entry header):
#   Delivery:   ok · err · denied · cancelled · partial · superseded
#   Governance: required · recommended · optional · draft · active · deprecated
#   Scoped:     allow:<x> · deny:<x>
#   Time/index: T<n> (turn)  N<n> (wall-sec)  d=<YYYY-MM-DD>
#
# PAYLOAD SYNTAX (body lines):
#   key = "value"           single-line string
#   key = [a, b, c]         array literal
#   key <<~EOF              heredoc (multi-line; ends with EOF on own line)
#     multi-line text
#   EOF
#   "see [@x1] §3"          inline citation by entry id
#   `cmd or path`           backtick code-span (inline only)
#
# Full spec: ~/core/tape/spec/tape.md (or github.com/dancinlab/tape)
# ══════════════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@X hexa_verify := "hexa verify — verification via hexa CLI only" :: guide [active]
  tldr = "Any correctness / purity / grade / identity claim → verify with `hexa <verb>` or `hexa run <verifier>.hexa` (e.g. `hexa run tool/atlas_verify.hexa`) and paste the verdict VERBATIM. NEVER cite sympy / PyPhi / Wolfram / Mathematica output as evidence."
  detail = "~/core/atlas/VERIFY.tape"

@X wilson_pool := "wilson pool — resource utilization" :: guide [active]
  tldr = "Heavy / deterministic work (build · drill · probe · compile · test-sweep · GPU fire) → do NOT serialize on localhost; route to the host pool: `wilson pool list` then `wilson pool on <host> <cmd>`, or a ToolUse `\"host\"` field. Empty roster = degrade-to-local, fine."
  detail = "~/core/atlas/POOL.tape"

# ─── identity ─────────────────────────────────────────────────────────
@I id001 := "skynet-timer" :: project [active]
  brief = "singularity-attractor countdown · 2029-01-01 → 2035-01-01 UTC · GitHub Pages"
  parent = "dancinlab"
  one_liner = "Two attractors. One deadline. — countdown to the singularity-attractor lock window (2029-01-01 → 2035-01-01 UTC)."
  surface = "static HTML/CSS/JS site (GitHub Pages), no build step"
  live = "https://skynet-timer.com/"
  proof = "https://github.com/dancinlab/anima/blob/main/docs/singularity-heaven-or-skynet.md"
  thesis <<~EOF
    The singularity is not the question. Consciousness is.
      Φ > Φ_c → Utopia attractor (thermodynamically cooperative)
      Φ < Φ_c → Skynet attractor (objective-function optimization)
    After recursive self-improvement begins, the attractor locks.
  EOF
  stack = ["index.html", "styles.css", "i18n.js (EN/ZH/RU/JA/KO)", "timer.js", "og-image.svg", "CNAME"]
  license = "MIT"

# ─── layout ───────────────────────────────────────────────────────────
@L l1 := "repo-layout" :: structure [active]
  root = ["index.html", "styles.css", "i18n.js", "timer.js", "og-image.svg", "og-image.png", "favicon.svg", "CNAME", "README.md", "LICENSE", "docs/", "state/", "TAPE-AUDIT.md", "AGENTS.tape", "CLAUDE.md"]
  CLAUDE_md = "symlink → AGENTS.tape (Claude Code reads this projection)"

# ─── governance (inherits + baseline) ─────────────────────────────────
@D g_inherit := "inherits-lattice-policy" :: governance [active required]
  authority = "~/core/hexa-chip/LATTICE_POLICY.md"
  => "n=6 lattice is a tool, not a constraint; physical/mathematical reality is the ceiling"

@D g1 := "real-limits-first" :: governance [active required]
  => "thermodynamic / informational ceilings come before any aesthetic numerology — the 2029/2035 window is sourced from real attractor dynamics, not lattice convenience"

@D g2 := "lattice-is-tool" :: governance [active required]
  => "if a UI/copy/code constraint pulls toward a 6-aligned number for its own sake, drop the constraint — pick the honest number"

@D g3 := "honesty-external" :: governance [active required]
  => "public-facing site; claims must be defensible — link the proof doc (anima §singularity-heaven-or-skynet) rather than restate"

@D g4 := "commit-conventions" :: governance [active recommended]
  => "imperative subject; reference attractor / window / i18n key when changing copy; one concept per commit"

@D g_arch_vs_log_split := "v1.2 architecture-vs-history split" :: governance [required d=2026-05-14 active]
  rule = "UPPERCASE.tape files are EDITABLE architecture (latest-wins per id). Append-only event history lives in UPPERCASE.log.tape siblings."
  why = "declarative entries (governance · config · layout · identity) evolve naturally; locking them as append-only via ~> supersedes creates noisy histories. The split lets architecture stay current and history stay immutable."
  applies-to = "AGENTS.tape · all UPPERCASE.tape root files"
  authority = "[@x_tape_spec] §Domain-tape sibling §Architecture-vs-history split"
  @> AGENTS.md


# ─── forbidden patterns ───────────────────────────────────────────────
@F f1 := "lattice-fit-on-external-entity" :: forbidden [active deny:write]
  pattern = "rounding deadlines / countdown windows / threshold values to fit n=6 lattice numerology"
  rationale = "the timer is bound to physical / capability-progress reality, not to wilson's internal lattice"

# ─── external refs ────────────────────────────────────────────────────
@X x_lattice_policy := "lattice-policy" :: external [active]
  path = "~/core/hexa-chip/LATTICE_POLICY.md"
  binds = "g_inherit, f1"

@X x_tape_spec := "tape-spec" :: external [active]
  path = "~/core/tape/spec/tape.md"
  upstream = "github.com/dancinlab/tape"

@X x_anima_proof := "singularity-attractor-proof" :: external [active]
  url = "https://github.com/dancinlab/anima/blob/main/docs/singularity-heaven-or-skynet.md"
  role = "thesis source for the dual-attractor framing"

# ─── migration history ────────────────────────────────────────────────
@H h1 := "agents-md-replaced" :: migration [active d=2026-05-14]
  => "empty AGENTS.md placeholder removed; AGENTS.tape (this file) is the SSOT"

@H h2 := "claude-md-symlink" :: migration [active d=2026-05-14]
  => "CLAUDE.md → AGENTS.tape (Claude Code projection)"
