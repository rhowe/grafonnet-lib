# Grafonnet

Jsonnet libraries for writing Grafana dashboards as code.

This is a fork of grafonnet-lib from Grafana Labs, with improved support for
recent Grafana features.

The original library has
[documentation](https://grafana.github.io/grafonnet-lib/) from Grafana although
this codebase has diverged somewhat from the API described there.

## New Grafonnet library from Grafana

You should probably only use this fork if you have an existing codebase using
the old `grafonnet-lib` codebase from Grafana but want to use new panel types.

Grafana have since launched a new Grafonnet library which is not backwards
compatible, but is the future of Grafonnet development. You should probably use
that instead of this.

Find the new library at [grafana/grafonnet](https://github.com/grafana/grafonnet).

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
