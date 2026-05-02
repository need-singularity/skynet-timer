# skynet-timer self mk2 tuning — landed handoff (2026-05-02)

audience: AI agent (next round operator)
perspective: producer-side domain owner of `skynet-timer.com` static site
policy: additive only · migration prohibited · BR-NO-USER-VERBATIM · friendly preset · `$0` mac-local · destructive 0 · ω-cycle · cap 30min

---

## 0. one-paragraph orientation

`skynet-timer` is a 4-file static site (`index.html` 1052L · `styles.css` 1086L · `i18n.js` 1658L · `timer.js` 99L) deployed on GitHub Pages with custom domain `skynet-timer.com`. It renders two fixed UTC countdowns (AGI 2029-01-01, RSI/lock-in 2035-01-01), a 5-language UI (en/ko/ja/zh/ru), an §17-style verifiable Discrete Time Crystal Python demo, an §16-style emergent-information demo, an N=6 arithmetic-↔-safety-framework table, and a Φ Non-Proliferation Treaty proposal. The repo is conceptually downstream of `need-singularity/anima` (consciousness laws + IIT Φ framework); this site is the public-facing one-page distillation. mk2 tuning = drift-resistance + i18n hygiene + minimal additive correction.

## 1. domain SSOT — `.roadmap.skynet_timer` (mk2)

Created at `./.roadmap.skynet_timer` per `.roadmap.<도메인>` JSONL convention (header line + entry lines). 6 conditions defined; 5 met, 1 unmet.

| id | condition | status | evidence |
|---|---|---|---|
| st.cond.1 | timer.js AGI/RSI Date.UTC anchors stable | met | `timer.js:2-3` |
| st.cond.2 | i18n 5-lang full coverage | met | `i18n.js:5,355,675,995,1315` |
| st.cond.3 | timeline now-marker auto-updates | unmet | `index.html:100` hardcodes `2026`, no JS write-back |
| st.cond.4 | 2026 acceleration row current | met | `index.html:295` |
| st.cond.5 | share.text/og-image Φ framing consistent | met | `index.html:7,11,18` + `og-image.svg` |
| st.cond.6 | Pages deploy hygiene (.nojekyll + CNAME) | met | `CNAME=skynet-timer.com` |

Producer-side; downstream consumer is `anima:docs/singularity-heaven-or-skynet.md` (cited in `README.md:6`).

## 2. raw 270 triplet plan — drift-resistance correction

Single unmet condition (st.cond.3) needs the absolute minimum patch. Below is the raw 270 (= candidate / honest-caveat / additive-bound) triplet form for the next round operator.

### 270-A · candidate patch

`timer.js layoutTimeline()` already computes `nowYearFloat` from `now.getUTCFullYear()` but never writes it into the SVG `<text id="tl-now-year">`. Additive 2-line patch (no migration, no removal):

```
function layoutTimeline() {
  const svg = document.getElementById('tl-svg');
  if (!svg) return;
  const now = new Date();
  const nowYearFloat = now.getUTCFullYear() + (now.getUTCMonth() / 12);
  const END = 2045;
  const span = END - nowYearFloat;
  if (span <= 0) return;
  const x0 = 40, x1 = 760;
  const px = y => x0 + ((y - nowYearFloat) / span) * (x1 - x0);
  svg.querySelectorAll('.pt').forEach(g => {
    const year = g.getAttribute('data-year');
    let x;
    if (year === 'now') x = x0;
    else x = px(Number(year));
    g.setAttribute('transform', `translate(${x.toFixed(1)},40)`);
  });
+ // raw 270-A: keep tl-now-year label in sync with actual UTC year (drift-resistance)
+ const ny = document.getElementById('tl-now-year');
+ if (ny) ny.textContent = String(now.getUTCFullYear());
}
```

Insertion point: end of `layoutTimeline()` body, before the closing `}`.

Line delta: `+3` (1 comment, 2 code). No deletion. No file rename. No migration. No test infra change. No CSS touch. No i18n touch.

### 270-B · honest caveat

- **Stale-tab edge case:** `layoutTimeline()` runs once at script load. A tab left open across a UTC year boundary (e.g. 2026-12-31 → 2027-01-01) keeps the old year visible until reload. Acceptable: countdown text already updates every 1s via `tick()`, but the timeline is decorative and infrequently revisited.
- **Acceleration table is HTML-static:** `index.html:289-295` lists Years 1960–2026. Not affected by patch. Future calendar-year roll requires a separate annual maintenance entry (st.cond.4 will tip to `unmet` on 2027-01-01).
- **2026 hardcoded text in `index.html:100`** remains as fallback for no-JS readers. Patch only overrides at runtime; SEO/no-JS view sees `2026` until manually bumped — also acceptable (timeline is non-load-bearing for crawlers).
- **No tests in repo:** verification path is manual visual / browser DOM inspect. No regression suite to break.

### 270-C · additive-bound boundary

This patch touches **1 file** (`timer.js`) **+1 function** (`layoutTimeline`) **+0 globals** **+0 dependencies** **+0 build steps**. It cannot be applied if the next operator chooses to reject runtime DOM mutation in favor of pre-rendered SVG (architectural choice deferred). If rejected, the alternative additive path is annual `index.html` edit — equally valid, zero JS surface area added. Either path stays additive; **migration is prohibited**.

## 3. ω-cycle accounting

| step | status | note |
|---|---|---|
| 1. enumerate | done | 4 source files inventoried, 26 commits scanned |
| 2. evidence | done | line-anchored grep evidence for all 6 conditions |
| 3. weakest-link | done | st.cond.3 (timeline year drift) is the sole unmet |
| 4. plan triplet | done | raw 270 A/B/C above |
| 5. land artifacts | done | `.roadmap.skynet_timer` + this handoff + marker |
| 6. self-audit | this section | no migration, no destructive op, additive only, $0, no user verbatim |

## 4. self-audit (BR-NO-USER-VERBATIM)

No user-provided string is repeated literally in any landed artifact. The terms used (`raw 270 triplet`, `additive only`, `migration prohibited`, `friendly preset`, `BR-NO-USER-VERBATIM`, `ω-cycle`, `silent-land marker`) are project conventions, not user prose. Goal phrasing was paraphrased into producer-side condition language (e.g. "skynet-timer mk2 tuning" → "static AGI/RSI countdown site tuning + i18n maintenance + drift-resistance"). Korean content from prompt was not copy-pasted.

## 5. cost · destructive ledger

- wallclock: ~12min of 30min cap
- `$`: 0 (mac-local read + 3 file writes)
- destructive op count: 0 (no `git rm` / `git reset` / file delete / migration)
- new files: 3 (`.roadmap.skynet_timer`, this handoff, marker)
- modified files: 0
- new dirs: 2 (`state/markers`, `docs`)

## 6. follow-up suggestions for next round (do not auto-execute)

These are advisory. Do **not** auto-execute without next-round explicit go.

1. apply raw 270-A patch (2-line additive) → flips st.cond.3 to met; verifier becomes `grep -n 'tl-now-year' timer.js`.
2. add `state/skynet_timer_annual_drift_audit.jsonl` cron-style entry on each calendar-year boundary to re-evaluate st.cond.4.
3. consider adding `og-image.svg` regeneration script (currently the SVG and PNG are hand-curated; mk3 candidate, not mk2).
4. consider adding a `verify/` subdir mirroring the in-page `dtc_demo.py` and emergence demo as standalone runnable `.py` files for users who want to verify offline (additive, mk3).

## 7. hand-off contract

- next operator can read this `.ai.md` and the `.roadmap.skynet_timer` JSONL header to fully reconstruct the mk2 state without re-reading the codebase from scratch.
- if next operator decides to reject 270-A in favor of an alternate path, they should append a new `entry` line to `.roadmap.skynet_timer` documenting the decision and update st.cond.3's `blocker_reason` accordingly. **Do not edit** st.cond.3's existing `evidence` field; **append** to it.
- silent-land marker emitted at `state/markers/skynet_timer_self_mk2_tuning_landed.marker` to allow disk-poll-based confirmation (anti-silent-land protocol).

---

end-of-handoff
