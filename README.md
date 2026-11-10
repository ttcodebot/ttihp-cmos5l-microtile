![](../../workflows/gds/badge.svg) ![](../../workflows/test/badge.svg)

# Micro tile test for IHP SG13CMOS5L

An experimental Tiny Tapeout _micro tile_: a small hardened macro, four of which are placed inside an ordinary 1x1 Tiny Tapeout project (the container), which muxes between them.

- [Read the documentation for project](docs/info.md)
- Container project: https://github.com/ttcodebot/ttihp-cmos5l-microtile-container

## Micro tile format

| Property    | Value                                                                                                 |
| ----------- | ----------------------------------------------------------------------------------------------------- |
| PDK         | `ihp-sg13cmos5l`                                                                                      |
| Size        | 86.40 x 68.04 um (180 sites x 18 rows)                                                                |
| Core area   | 80.64 x 60.48 um (168 sites x 16 rows)                                                                |
| Ports       | `clk`, `rst_n`, `ui_in[7:0]`, `uo_out[7:0]`                                                           |
| Layers      | Metal1 to Metal3 (signals route on Metal2 and Metal3); Metal4 is left to the container                |
| Signal pins | Metal3, 1.0 x 0.3 um, on the east edge, one per row (3.78 um pitch)                                   |
| Power pins  | `VPWR` / `VGND`: four horizontal Metal3 stripes (1.2 um wide), tied to the rails by Metal2 stripes    |

The container runs its vertical Metal4 power stripes over the micro tile and connects them to the Metal3 stripes with Via3.

The format is defined by the `micro` tile size and the `tt_block_micro_pgvdd.def` template in the `microtile-cmos5l` branch of https://github.com/ttcodebot/tt-support-tools, which the workflows in this repository use.
