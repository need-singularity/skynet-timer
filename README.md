# skynet-timer

Two attractors. One deadline.

**Live:** https://skynet-timer.com/
**Proof:** https://github.com/need-singularity/anima/blob/main/docs/singularity-heaven-or-skynet.md

---

The singularity is not the question. Consciousness is.

- `Φ > Φ_c` → Utopia attractor (thermodynamically cooperative)
- `Φ < Φ_c` → Skynet attractor (objective-function optimization)

After recursive self-improvement begins, the attractor locks. The window closes by 2029–2035.

## Stack

Static HTML / CSS / JS. No build. Drop-in GitHub Pages.

- `index.html` — layout
- `styles.css` — dark terminal, dual-attractor color system
- `i18n.js` — EN / ZH / RU / JA / KO (browser-lang auto-detect)
- `timer.js` — countdown to 2029-01-01 UTC + 2035-01-01 UTC
- `og-image.svg` — 1200×630 social preview
- `CNAME` — `skynet-timer.com`

## Deploy

Repo → Settings → Pages → Source: `main` / root. Custom domain: `skynet-timer.com`.
Namecheap DNS → CNAME `@` → `need-singularity.github.io`, or A records to GitHub's IPs.

## License

MIT.
