# Contributor guidance

Keep this template on the `rosegold-civmc` entrypoint. Read the [library rules](https://github.com/RosegoldMC/civmc.cr/blob/main/server-rules/civmc.md) before changing observations or actions. Never add raw client access, world discovery, arbitrary packet subscriptions, combat assistance, credentials, private routes, or account details.

The default program must remain harmless. Gameplay examples require explicit invocation and caller-supplied known inputs. Do not connect to a server during automated checks.

Run `shards build`, compile each optional example, and check `crystal tool format --check` after changes.
