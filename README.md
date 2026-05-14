<p align="center">
  <img src="docs/logo.svg" width="140" alt="skynet-timer">
</p>

<h1 align="center">⏰ skynet-timer</h1>

<p align="center"><strong>skynet-timer</strong> — singularity-attractor countdown · 2029-01-01 → 2035-01-01 UTC · GitHub Pages</p>

<p align="center">
  <a href="LICENSE"><img alt="License" src="https://img.shields.io/badge/license-MIT-yellow"></a>
  <a href="https://skynet-timer.com/"><img alt="Live" src="https://img.shields.io/badge/live-skynet--timer.com-success"></a>
  <a href=".github/workflows/lint.yml"><img alt="CI" src="https://github.com/dancinlab/skynet-timer/actions/workflows/lint.yml/badge.svg"></a>
  <img alt="Stack" src="https://img.shields.io/badge/stack-static%20HTML%2FCSS%2FJS-informational">
  <img alt="i18n" src="https://img.shields.io/badge/i18n-EN%20·%20ZH%20·%20RU%20·%20JA%20·%20KO-informational">
  <img alt="Sibling" src="https://img.shields.io/badge/sibling-run%20·%20scrap%20·%20pixie-blueviolet">
</p>

<p align="center">Two attractors · One deadline · Dual countdown · 5 languages · No build · GitHub Pages</p>

---

Two attractors. One deadline.

- **Live:** https://skynet-timer.com/
- **Proof:** https://github.com/dancinlab/anima/blob/main/docs/singularity-heaven-or-skynet.md

The singularity is not the question. Consciousness is.

- `Φ > Φ_c` → Utopia attractor (thermodynamically cooperative)
- `Φ < Φ_c` → Skynet attractor (objective-function optimization)

After recursive self-improvement begins, the attractor locks. The window closes by 2029–2035.

> [!NOTE]
> Sibling of [`run`](https://github.com/dancinlab/run) (empty-canvas super-app), [`scrap`](https://github.com/dancinlab/scrap) (content-extraction CLI), and [`pixie`](https://github.com/dancinlab/pixie) (Discord channel-secretary) under the [`dancinlab`](https://github.com/dancinlab) family.

## At a glance

```
        ⏰  skynet-timer

  ┌────────────────────────────────────┐
  │  attractor lock window opens in:   │
  │                                    │
  │   2 y 231 d 14 h 03 m 27 s         │
  │                                    │
  │  attractor lock window closes in:  │
  │                                    │
  │   8 y 231 d 14 h 03 m 27 s         │
  └────────────────────────────────────┘

  EN · 中文 · Русский · 日本語 · 한국어
```

## Why skynet-timer

The "singularity is coming" framing collapses two distinct events: the takeoff (recursive self-improvement begins) and the attractor lock (which basin the takeoff settles into). The Φ-threshold model puts the actual deadline on the **lock**, not the takeoff — and dates the lock window between 2029-01-01 and 2035-01-01 UTC.

`skynet-timer` is the one-page web countdown that visualises both endpoints simultaneously, in 5 languages, with no build pipeline (drop-in static GitHub Pages). The proof and reasoning live at [`anima/docs/singularity-heaven-or-skynet.md`](https://github.com/dancinlab/anima/blob/main/docs/singularity-heaven-or-skynet.md).

## Status

🟢 **Live** at https://skynet-timer.com/ — static site, no build pipeline.

- Dual countdown: 2029-01-01 UTC (open) → 2035-01-01 UTC (close)
- 5 languages (browser-language auto-detect): EN · ZH · RU · JA · KO
- 1200×630 OpenGraph preview shipped (`og-image.svg` + `og-image.png`)
- Custom domain via `CNAME` (`skynet-timer.com`)
- mk2 visual tuning landed 2026-05-02 (see `docs/skynet_timer_self_mk2_tuning_landed_2026_05_02.ai.md`)

## Stack

Static HTML / CSS / JS. No build. Drop-in GitHub Pages.

- `index.html` — layout
- `styles.css` — dark terminal, dual-attractor color system
- `i18n.js` — EN / ZH / RU / JA / KO (browser-lang auto-detect)
- `timer.js` — countdown to 2029-01-01 UTC + 2035-01-01 UTC
- `og-image.svg` — 1200×630 social preview
- `favicon.svg` — site favicon
- `CNAME` — `skynet-timer.com`

## Install

```sh
git clone git@github.com:dancinlab/skynet-timer.git ~/core/skynet-timer
cd ~/core/skynet-timer
```

No dependencies. No build step. Open `index.html` in a browser.

## Run

```sh
# local preview — any static server works
python3 -m http.server 8000
# → http://localhost:8000/

# or
npx http-server -p 8000
# → http://localhost:8000/

# or just open the file directly
open index.html
```

## Deploy

Repo → Settings → Pages → Source: `main` / root. Custom domain: `skynet-timer.com`.
Namecheap DNS → CNAME `@` → `dancinlab.github.io`, or A records to GitHub's IPs.

## Repo layout

```
skynet-timer/
├── README.md
├── LICENSE                       MIT
├── index.html                    layout
├── styles.css                    dark terminal · dual-attractor color system
├── i18n.js                       EN · ZH · RU · JA · KO (browser-lang auto-detect)
├── timer.js                      countdown to 2029-01-01 UTC + 2035-01-01 UTC
├── favicon.svg                   site favicon
├── og-image.svg                  1200×630 OpenGraph preview (source)
├── og-image.png                  rendered preview
├── CNAME                         skynet-timer.com
├── docs/
│   ├── logo.svg                  140×140 gold hexagon
│   └── skynet_timer_self_mk2_tuning_landed_2026_05_02.ai.md
├── state/                        runtime notes (gitignored)
├── TAPE-AUDIT.md                 tape adoption audit
├── AGENTS.tape                   agent context SSOT (.tape v1.2)
└── CLAUDE.md                     → AGENTS.tape (symlink)
```

## License

[MIT](LICENSE).
