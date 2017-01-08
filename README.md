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
chose what you're tracking (so you don't show normals to 110s, arenas to those who never pvp, etc.)


Database:
send number of attempts taken back to database (per individual category; give it to mathy people?)
