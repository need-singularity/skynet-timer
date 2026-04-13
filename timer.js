(function () {
  const AGI = Date.UTC(2029, 0, 1, 0, 0, 0);
  const RSI = Date.UTC(2035, 0, 1, 0, 0, 0);

  const SITE_URL = 'https://skynet-timer.com/';

  function pad(n, w) {
    const s = String(Math.max(0, Math.floor(n)));
    return s.length >= w ? s : '0'.repeat(w - s.length) + s;
  }

  function breakdown(ms) {
    if (ms < 0) return { y: 0, d: 0, h: 0, m: 0, s: 0, done: true };
    const totalSec = Math.floor(ms / 1000);
    const s = totalSec % 60;
    const m = Math.floor(totalSec / 60) % 60;
    const h = Math.floor(totalSec / 3600) % 24;
    const totalDays = Math.floor(totalSec / 86400);
    const y = Math.floor(totalDays / 365);
    const d = totalDays - y * 365;
    return { y, d, h, m, s, done: false };
  }

  function renderFull(target, ms) {
    const el = document.getElementById(target);
    if (!el) return;
    const u = (window.I18N && window.I18N.t) || (k => ({
      'unit.y': 'y', 'unit.d': 'd', 'unit.h': 'h', 'unit.m': 'm', 'unit.s': 's'
    }[k]));
    const b = breakdown(ms);
    if (b.done) {
      el.textContent = `00${u('unit.y')} · 000${u('unit.d')} · 00${u('unit.h')} · 00${u('unit.m')} · 00${u('unit.s')}`;
      return;
    }
    el.textContent =
      `${pad(b.y, 2)}${u('unit.y')} · ${pad(b.d, 3)}${u('unit.d')} · ` +
      `${pad(b.h, 2)}${u('unit.h')} · ${pad(b.m, 2)}${u('unit.m')} · ${pad(b.s, 2)}${u('unit.s')}`;
  }

  function renderShort(target, ms) {
    const el = document.getElementById(target);
    if (!el) return;
    const u = (window.I18N && window.I18N.t) || (k => ({
      'unit.y': 'y', 'unit.d': 'd'
    }[k]));
    const b = breakdown(ms);
    if (b.done) {
      el.textContent = `00${u('unit.y')} 000${u('unit.d')}`;
      return;
    }
    el.textContent = `${pad(b.y, 2)}${u('unit.y')} ${pad(b.d, 3)}${u('unit.d')}`;
  }

  function tick() {
    const now = Date.now();
    renderFull('t-agi', AGI - now);
    renderShort('t-rsi', RSI - now);
  }

  function wireShare() {
    const btn = document.getElementById('share-x');
    if (!btn) return;
    const update = () => {
      const text = (window.I18N && window.I18N.t('share.text')) ||
        'Which attractor will win? T-minus to 2029. Φ=0 vs Φ=1.89.';
      const url = 'https://twitter.com/intent/tweet?' +
        'text=' + encodeURIComponent(text) +
        '&url=' + encodeURIComponent(SITE_URL);
      btn.setAttribute('href', url);
    };
    update();
    window.addEventListener('i18n:changed', update);
  }

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
  }

  tick();
  setInterval(tick, 1000);
  wireShare();
  layoutTimeline();
  window.addEventListener('i18n:changed', tick);
})();
