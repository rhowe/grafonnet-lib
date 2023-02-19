# Grafonnet

Jsonnet libraries for writing Grafana dashboards as code.

This is a fork of grafonnet-lib from Grafana Labs, with improved support for
recent Grafana features.

Grafana's docs are here: https://grafana.github.io/grafonnet-lib/ although this
codebase has diverged somewhat from the API described there.

## What's different in this fork?

Support for Grafana 9 panel types:

- Stat panel
- Table panel
- Timeseries panel

# Grafonnet 7

This fork does not contain any changes for grafonnet 7, which is an attempt to generate the grafonnet library from the [grafana/dashboard-spec](https://github.com/grafana/dashboard-spec) dashboard specification collection.

It is being supplanted by a similar effort which aims to generate the library
from CUE definitions. Once that effort is complete, this fork can probably be
retired.

## Contributing

Please contribute! If you're interested, please start by reading the
[contributing guide](CONTRIBUTING.md). Before you begin work please take note of
our code of conduct and ensure that what you'd like to contribute is within the
scope of what Grafonnet attempts to support.

## Upgrading Cypress

- Update version numbers in e2e/package.json and e2e/docker-compose.dev.yml
- `make e2e-npm-install` to update e2e/package-lock.json
