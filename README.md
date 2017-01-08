# LegionLegendaryTracker
World of Warcraft Addon for tracking legendary drop chances in Legion.

Tracks drop chances from:
    Dungeon bosses (normal, heroic, mythic)       // Statistics only counts end boss kills on all three difficulties. ex: Cordana
    Raid bosses (LFR, normal, heroic, mythic)     // Statistics counts each boss on all 4 difficulty levels
    World bosses                                  // not trackable by statistics - WQ trigger?
    Emissary Caches                               // WQ trigger?
    Arena wins                                    // statistic doesn't seem to track skirmish, only rated
    Battleground Wins                             // tracked in Statistics, both rated and total (separate buckets? check)
    PvP Strongboxes                               //
    Mythic+ Weekly Caches                         //
    mythic+ chests at the end of the run (1/2/3)  //
    Rare mobs                                     // first time only? event ID?
    Treasures (legion)                            // ID?

Also should show total chances on current track count.

UI Interface Buttons:
save button with box/dropdown to set which legendary number this is. and box for partial count.
reset button (are you sure?)


Database:
send number of sttempts taken back to databse (per individual)