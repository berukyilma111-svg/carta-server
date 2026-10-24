# The Carta game server: the game's content (carta.pck) run headless by the
# official Godot 4.6.2 build, listening for players on the port Render gives.
FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends wget unzip ca-certificates \
 && wget -q https://github.com/godotengine/godot/releases/download/4.6.2-stable/Godot_v4.6.2-stable_linux.x86_64.zip \
 && unzip -q Godot_v4.6.2-stable_linux.x86_64.zip && mv Godot_v4.6.2-stable_linux.x86_64 /usr/local/bin/godot \
 && rm Godot_v4.6.2-stable_linux.x86_64.zip && apt-get purge -y wget unzip && rm -rf /var/lib/apt/lists/*
COPY carta.pck /carta.pck
CMD godot --headless --main-pack /carta.pck -- --server --port=${PORT:-10000}
