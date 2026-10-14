# CivMC bot example

A starting point for CivMC bots using [rosegold-civmc](https://github.com/RosegoldMC/civmc.cr). The default program connects, prints a greeting locally, and disconnects. It sends no chat and performs no gameplay actions.

Install Crystal and Shards, then run:

```sh
shards install
shards run bot
```

Rosegold handles Microsoft account authentication. Keep authentication files and credentials private. CivMC permits one account and prohibits proxy, VPN, and VPS connections; run from an allowed connection. Read the [CivMC library rules](https://github.com/RosegoldMC/civmc.cr/blob/main/server-rules/civmc.md) before adding behavior.

`SERVER_ADDRESS` overrides the default `play.civmc.net:25565` for a controlled test server. The override does not change the library's policy.

## Optional examples

Only invoke an elevator example after placing your bot on a known jump/sneak elevator. Set `TARGET_Y` to its known destination:

```sh
TARGET_Y="$KNOWN_DESTINATION_Y" crystal run examples/elevator.cr
```

The XP example consumes carried items. Set `XP_ITEM` to an item supported by your server and `TARGET_LEVEL` to the desired level:

```sh
XP_ITEM="$CARRIED_XP_ITEM" TARGET_LEVEL="$DESIRED_LEVEL" crystal run examples/xp.cr
```

Both helpers have finite timeouts and release their inputs. Their behavior still needs validation against your test server's plugins.

Give a helper exclusive control of movement, look, and item use while it runs. Event handlers must spawn work that waits for ticks.

## Migrating an existing bot

Replace the direct `rosegold` dependency with `rosegold-civmc`, require `rosegold-civmc`, and construct `Rosegold::CivMC::Bot`. Use the restricted inventory and container APIs. Raw clients, world queries, and arbitrary packet subscriptions are unavailable. See the [library documentation](https://github.com/RosegoldMC/civmc.cr) for boundary and migration details.

The facade reduces accidental misuse. It cannot prevent prohibited purposes such as combat assistance, or deliberate bypass through another dependency.

## Checks

CI builds the default program on Linux and Windows and compiles the optional examples. It never connects a bot or consumes items.
