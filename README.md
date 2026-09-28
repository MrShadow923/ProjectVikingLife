Viking Life

A 3D Viking-themed survival and simulation game built with Godot 4. Explore a living Scandinavian world featuring village life, dynamic day/night cycles, hunting, crafting, and Norse mythology.



 🛠 Tech Stack & Requirements

Engine:** Godot 4.x (Standard / Non-.NET)


Renderer:** Forward+ (or Mobile for low-spec hardware)


Language:** GDScript


Version Control:** Git & GitHub





📁 Project Structure

```text
res://
├── assets/                  # Raw art, audio, and mesh assets[cite: 1]
│   ├── audio/              # Sound effects and music[cite: 1]
│   ├── models/             # 3D meshes (trees, structures, props)[cite: 1]
│   ├── textures/           # Materials and terrain textures[cite: 1]
│   └── ui/                 # Crosshairs and UI graphics[cite: 1]
├── data/                    # Custom Resources (.tres) and JSON data files[cite: 1]
│   ├── items/              # Item resources (wood, iron, meat)[cite: 1]
│   ├── npcs/               # Dialogue trees and schedule definitions[cite: 1]
│   ├── quests/             # Quest resources and objectives[cite: 1]
│   └── recipes/            # Crafting and smelting recipes[cite: 1]
├── scenes/                  # Packed scene files (.tscn) ONLY[cite: 1]
│   ├── inventory/          # Inventory and UI slot containers[cite: 1]
│   ├── npcs/               # NPC base scenes[cite: 1]
│   ├── player/             # Player controller and camera rigs[cite: 1]
│   ├── time/               # Bed and clock UI elements[cite: 1]
│   ├── ui/                 # HUD, dialogue box, and pause menus[cite: 1]
│   ├── wildlife/           # Animal entities (deer, wolf, bear)[cite: 1]
│   └── world/              # Test maps, terrain, and world nodes[cite: 1]
└── scripts/                 # GDScript source code (.gd) ONLY[cite: 1]
    ├── inventory/          # Inventory system logic[cite: 1]
    ├── npcs/               # NPC movement and AI scripts[cite: 1]
    ├── player/             # Player movement and camera logic[cite: 1]
    ├── quests/             # Quest manager logic[cite: 1]
    ├── save/               # Save/load management[cite: 1]
    ├── time/               # Autoload game clock script[cite: 1]
    ├── wildlife/           # Animal state machines[cite: 1]
    └── world/              # Interactable base scripts and environment logic[cite: 1]

```

 🎮 Controls & Keybindings

| Action | Binding | Description |
| --- | --- | --- |
| Move | `W` `A` `S` `D` | Movement directional input

 |
| Sprint | `Shift` | Increase movement speed

 |
| Jump | `Space` | Jump

 |
| Interact | `E` | Interact with objects, items, and NPCs

 |
| Attack | `Left Mouse` | Melee or ranged attack

 |
| Block | `Right Mouse` | Guard incoming damage

 |
| Dodge | `C` / `Alt` | Perform a dodge roll

 |
| Inventory | `Tab` | Toggle inventory window

 |
| Perspective Toggle | `V` / `Middle Mouse` | Switch between 1st-person and 3rd-person views

 |



 🗺 Development Roadmap

Phase 1: Project Setup** — Core project initialization, folder structure, Git control, input mappings, and test world.


Phase 2: Player Systems** — 3rd/1st-person controller, camera rig with seamless view switching, and raycast interaction.


*Phase 3: World Building** — Terrain generation, atmospheric lighting, village blockouts, and interior cave nodes.


Phase 4: Time Cycle** — Autoload game clock, rotating celestial lighting, and bed/sleep systems.


Phase 5: Wildlife AI** — Navigation mesh and behavioral state machines for deer, wolves, and bears.


Phase 6: Resources & Inventory** — Custom `.tres` item data, inventory container backend, UI grid, and resource nodes.


Phase 7: Crafting & Combat** — Smelting recipes, equipment durability, stamina management, and basic combat.


Phase 8: Living Village & NPCs** — JSON-driven dialogue system, scheduled daily routines, and trading.


Phase 9: Quests** — Quest manager, dialogue quest triggers, and journal tracking.


Phase 10: Save System** — Local JSON save and load system using runtime `user://` storage.


Phases 11–13: Mythology & Polish** — Shrine mechanics, mythology lore, audio pass, and build exports.





## 🚀 Getting Started

1. Download and install [Godot Engine 4.x (Standard)](https://godotengine.org/?utm_source=gemini).


2. Clone the repository to your local system:
```cmd
git clone https://github.com/YOUR_USERNAME/VikingLife.git

```


3. Open Godot, click **Import**, and choose the `project.godot` file.


4. Press **F5** to launch the default scene (`scenes/world/test_world.tscn`).
