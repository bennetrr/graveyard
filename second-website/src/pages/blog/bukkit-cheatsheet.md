---
layout: '$/components/templates/BasePost.astro'
title: Bukkit API Cheatsheet
description: Many code snippets for developing plugins with the Bukkit / Spigot / Paper API.
publicationDate: 2023-10-24
#image:
#  src: '/assets/github.svg'
#  alt: 'Image post 2'
---

## Plugin generator for IntelliJ IDEA

There is an IntelliJ Plugin that generates skeletons for plugin and mod projects.

- [Plugin Page](https://plugins.jetbrains.com/plugin/8327-minecraft-development)
- [Documentation](https://mcdev.io/docs/create.html)

## Event cheatsheet

### `BlockBreakEvent`, `BlockPlaceEvent`

Called when a player breaks / places a block.

### `EntityExplodeEvent`

Called when an entity (TNT, Fireball, Creeper, ...) explodes.

### `PrepareItemCraftEvent`

Called when a player interacts with the crafting menu.

#### Example: Disable crafting

```java
public class CraftingProtection implements Listener {
    @EventHandler(priority = EventPriority.LOWEST)
    public void onCrafting(PrepareItemCraftEvent event) {
        if (event.getInventory().getResult() != null) {
            event.getInventory().setResult(new ItemStack(Material.AIR));
            event.getViewers().forEach(player -> player.sendMessage(Component.text("You're not allowed to craft any items!").color(NamedTextColor.RED)));
        }
    }
}
```

### `PlayerDeathEvent`

Called when a player dies.

### `PlayerRespawnEvent`

Called when a player respawns.

### `PlayerInteractEvent`

Called when a player tries to interact with something.

#### Example: Launch a fireball when the player right-clicks with a fire charge

```java
public class Fireball implements Listener {
    @EventHandler
    public void onFireballShoot(PlayerInteractEvent event) {
        Player player = event.getPlayer();
        PlayerInventory inventory = player.getInventory();
        ItemStack itemStack = inventory.getItemInMainHand();

        if (itemStack.getType() == Material.FIRE_CHARGE) {
            player.launchProjectile(Fireball.class);
            if (itemStack.getAmount() <= 0) inventory.setItemInMainHand(null);
            else {
                itemStack.setAmount(itemStack.getAmount() - 1);
                inventory.setItemInMainHand(itemStack);
            }
        }
    }
}
```

### `PlayerJoinEvent`

Called when a player joins the server.

### `InventoryCloseEvent`

Called when a player closes an inventory.

#### Example: Check items that a player bought from a villager

```java
public class TradeHandler implements Listener {
    @EventHandler(priority = EventPriority.LOWEST)
    public void onVillagerGUIClose(InventoryCloseEvent event) {
        // If the GUI is not a villager GUI, quit
        if (!(event.getInventory() instanceof MerchantInventory)) return;

        // Check if the sender is a player
        if (!(event.getPlayer() instanceof Player player)) return;

        // ...
    }
}
```

## Run tasks every tick

The following code needs to go into the `onEnable()` method of your plugin class:

```java
getServer().getScheduler().scheduleSyncRepeatingTask(this, () -> {
    // ...
}, 1L, 1L);
```

Source: [Is there a ServerTickEvent? | Bukkit Forum](https://bukkit.org/threads/on-server-tick-event.131575/#post-1564247)

## Working with villagers

```java
public class VillagerUtils {
    public static void clearTrades(Villager villager) {
        List<MerchantRecipe> newRecipes = new ArrayList<>();
        villager.setRecipes(newRecipes);
    }

    public static void addTrade(Villager villager, ItemStack buyItem1, @Nullable ItemStack buyItem2, ItemStack sellItem) {
        List<MerchantRecipe> oldRecipes = villager.getRecipes();

        MerchantRecipe newRecipe = new MerchantRecipe(sellItem, 999999999);
        newRecipe.addIngredient(buyItem1);
        if (buyItem2 != null) newRecipe.addIngredient(buyItem2);

        List<MerchantRecipe> newRecipes = new ArrayList<>(oldRecipes);
        newRecipes.add(newRecipe);
        villager.setRecipes(newRecipes);
    }

    public static void addTrade(Villager villager, ItemStack buyItem1, ItemStack sellItem) {
        addTrade(villager, buyItem1, null, sellItem);
    }
}
```

Source: [Adding custom trades to villagers | Spigot Forum](https://www.spigotmc.org/threads/adding-custom-trades-to-villagers.202265/)

## Working with players

### Kill a player

```java
player.setHealth(0.0D);
```

Source: [Plugin Tutorial | Bukkit Wiki](https://bukkit.fandom.com/wiki/Plugin_Tutorial_(Eclipse)#Killing_the_player)

### Working with teams

#### Create a team

```java
team = Bukkit.getScoreboardManager().getMainScoreboard().registerNewTeam("some_team");
```

#### Set the color, display name and prefix

```java
team.color(NamedTextColor.RED);
team.displayName(Component.text("Some Team"));
team.prefix(Component.text("[Some Team] "));
```

#### Make invisible teammates have a transparent body

```java
team.setCanSeeFriendlyInvisibles(true);
```

#### Add players from a list to the team

```java
players.stream().map(HumanEntity::getName).forEach(team::addEntry);
```

Source: [Scoreboards / Teams with the Bukkit API | Bukkit Forum](https://bukkit.org/threads/tutorial-scoreboards-teams-with-the-bukkit-api.139655/)

### Play sounds to a player

```java
player.playSound(Sound.sound(Key.key("minecraft:block.sculk_sensor.clicking"), Sound.Source.MASTER, 0.5F, 1));
```

## Working with items

### Spawn an item

```java
world.spawn(location, Item.class, item -> item.setItemStack(new ItemStack(Material.EMERALD, 3)))
```

### Get the name of an item

```java
@Nullable
public static String getDisplayName(ItemStack itemStack) {
    if (itemStack == null) return null;
    if (!itemStack.hasItemMeta()) return null;
    ItemMeta itemMeta = itemStack.getItemMeta();
    if (!itemMeta.hasDisplayName()) return null;
    return PlainTextComponentSerializer.plainText().serialize(itemMeta.displayName());
}
```

## Working with entities

### Check if an entity is in an area

```java
public bool entityInArea(Entity entity, Location loc1, Location loc2) {
    Vector loc1Vector = new Vector(loc1.getX(), 0, loc1.getZ());
    Vector loc2Vector = new Vector(loc2.getX(), 0, loc2.getZ());
    Vector entityVector = new Vector(entity.getLocation().getX(), 0, entity.getLocation().getZ());
    return entityVector.isInAABB(startVector, endVector);
}
```

## Working with potion effects

### Add a potion effect to a player

```java
player.addPotionEffect(new PotionEffect(PotionEffectType.FIRE_RESISTANCE, 200, 1));
```

### Remove all potion effects from a player:

```java
player.getActivePotionEffects().stream().map(PotionEffect::getType).forEach(player::removePotionEffect);
```

Source: [Add potion effect | Bukkit Forum](https://bukkit.org/threads/add-potion-effect.62082/#post-985016)

## Modify the world using the WorldEdit API

For adding the dependencies into your project, see [API Usage | FAWE Wiki](https://github.com/IntellectualSites/FastAsyncWorldEdit-Documentation/wiki/API-Usage#gradle---fawe-bukkit-and-core=).

### Convert a Bukkit `Location` to a WorldEdit `BlockVector3`

This function is also used in the examples below.

```java
public static BlockVector3 location2BlockVector3(Location loc) {
    return BukkitAdapter.adapt(loc).toVector().toBlockPoint();
}
```

### Fill an area with a material

```java
public static void fill(Location loc1, Location loc2, Material mat) {
    World world = BukkitAdapter.adapt(loc1.getWorld());

    // Select the region
    Region selection = new CuboidRegion(world, location2BlockVector3(loc1), location2BlockVector3(loc2));

    // Create a BlockState with air
    BlockState blockState = BukkitAdapter.adapt(mat.createBlockData());

    // This EditSession will be closed after the setBlocks command is finished
    try (EditSession editSession = WorldEdit.getInstance().newEditSession(world)) {
        editSession.setBlocks(selection, blockState);
    }
}
```

### Copy a region to another location

```java
public static void copy(Location startLoc, Location endLoc, Location pasteLoc) {
    World world = BukkitAdapter.adapt(startLoc.getWorld());

    // Select the region to copy
    CuboidRegion copyRegion = new CuboidRegion(world, location2BlockVector3(startLoc), location2BlockVector3(endLoc));
    BlockArrayClipboard clipboard = new BlockArrayClipboard(copyRegion);


    // This EditSessions will be closed after the copy and paste command is finished
    // Copy
    try (EditSession editSession = WorldEdit.getInstance().newEditSession(world)) {
        ForwardExtentCopy copyOperation = new ForwardExtentCopy(editSession, copyRegion, clipboard,copyRegion.getMinimumPoint());
        // You can specify settings here
        Operations.complete(copyOperation);
    }

    // Paste
    try (EditSession editSession = WorldEdit.getInstance().newEditSession(world)) {
        Operation pasteOperation = new ClipboardHolder(clipboard).createPaste(editSession).to(location2BlockVector3(pasteLoc)).build();
        // You can specify settings here
        Operations.complete(pasteOperation);
    }
}
```

### Sources

- https://worldedit.enginehub.org/en/latest/api/

## Creating custom commands

The [Cloud CommandFramework](https://github.com/Incendo/cloud) is a really good library for adding commands.

- [Documentation](https://github.com/Incendo/cloud/blob/master/docs/README.adoc)
- [Example Code using Annotators (by me, so it's not really good)](https://github.com/bennetrr/bedwars/blob/main/src/main/java/io/github/bennetrr/bedwarsplugin/BedwarsPlugin.java)
