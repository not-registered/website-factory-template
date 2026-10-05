# Website Factory Template

Private staging-only template for Hermes Website Factory projects.

The standard container:
- serves `index.html` on port 8080;
- runs as UID/GID 65534;
- receives a project-specific staging marker at image build time;
- is built and runtime-smoke-tested by GitHub Actions;
- publishes immutable `sha-<commit>` and mutable `staging` tags to GHCR on pushes to `main`.

The marker is derived from the repository slug:

`example-site` -> `GOKON-EXAMPLE_SITE-STAGING-OK`

Production is intentionally not part of this repository template.
