# rappelz_private_lua
# Lua script Rappelz Private Server Epic 7.2, 8.1

# Anti-macros system private rappelz Epic 8.1

1) You must have items in the form of numbers, when you click on a certain item, the answer should be returned in the form of the number that was clicked.

Example:
Item one return number one answer_insert (1)

2) Each time a mob is killed, the dead_guard_mob () function is called) 
Which counts the number of killed monsters and the time of the last killed monster

If the number of killed monsters reaches the range from 300 to 400, the variable isBlock = 1 is written, and they also ask to return the result of the check to remove the restrictions.

Example: 1 + 1 = 2

If you ignore it, then the next time you kill the monster, it will freeze you, but at the same time you will be prompted to check again, if you don't answer correctly, teleport you to the horizon

If you are not able to isBlock = 1, then you are warned about this

If you haven't killed any monsters for 800 seconds, taking into account the time of the last monster you killed, the counter is reset


Additionally, there is protection from killing monsters in any dungeon, to limit the level of characters.


# Anti-macros system private rappelz Epic 7.2

Only popup WEB-PAGE, not private_notice becouse epic 7.2 not supported thus function.
If you kill a certain number of monsters, you are frozen and popgs popup a web page for confirmation, you must enter a captcha.
