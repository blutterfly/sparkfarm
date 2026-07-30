# SPARK Farm Discovery Tour website

A responsive MkDocs Material website for a two-hour Grades 2–6 field trip combining agriculture, renewable energy, robotics, and sustainability.

## Run locally

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

Open <http://127.0.0.1:8000>.

## Build

```bash
mkdocs build --strict
```

The generated static website is written to `site/`.

## Customize before publishing

Update these placeholders:

- `site_url` in `mkdocs.yml`; optionally add your repository URL
- Booking email, phone, address, and website in `docs/booking.md`
- Organization details in `docs/about.md`
- Policies, pricing, capacity, and accessibility details after final operational review

## Deploy to GitHub Pages

The included `.github/workflows/deploy.yml` builds and publishes the site whenever changes are pushed to `main`. In GitHub, set **Settings → Pages → Source** to **GitHub Actions**.

## Deploy to Cloudflare Pages

Connect the repository in Cloudflare Pages and use:

- Build command: `pip install -r requirements.txt && mkdocs build --strict`
- Build output directory: `site`
- Python version: 3.11 or newer

## Content model

- `docs/index.md`: landing page
- `docs/experience.md`: two-hour program
- `docs/stations/`: four station pages
- `docs/teachers.md`: teacher preparation
- `docs/scheduling.md`: bus and cohort planning
- `docs/safety.md`: safety and accessibility
- `docs/learning-pathways.md`: follow-on classes
- `docs/faq.md`: frequently asked questions
- `docs/booking.md`: inquiry and booking page
