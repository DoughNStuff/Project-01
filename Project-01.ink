/*
    Project 01
    
    Requirements (for 15 base points)
    * Create an interactive fiction story with at least 8 knots 
    * Create at least one major choice that the player can make
    * Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    * Include more than eight passages
    * Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    * Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!
*/

VAR torches = 0


You've entered a strange cave and the enterance to the cave seals behind you. Looks like you have to traverse through this cave to escape.
*[Start walking] -> enterance

== enterance ==
The cave splits in two directions now.
*[Which way will you go?] -> choices

== choices ==
Which way?
*[Take the left tunnel] -> left_tunnel
*[Take the right tunnel] -> right_tunnel
->DONE

== choices2 ==
Which way?
+[Take the left tunnel this time] -> after_torch1
+[Take the right tunnel this time] -> after_torch2
->DONE

== left_tunnel ==
Down the dimly lit tunnel you start to notice signs of humanity in the form of a singular, lit torch. Something about it seems off, do you grab it?
*[Grab it] -> grab_torch1
*[Leave it be] -> after_torch1
->DONE

== grab_torch1 ==
~ torches = torches + 1
You grab the torch. The flame seems to burn just the slightest bit brighter, odd.
*[Continue] -> after_torch1
->DONE

== right_tunnel ==
Down the damp tunnel, you notice small puddles on the ground that gradually grow larger. You see a singular torch on the wall. Will you pick it up?
*[Grab torch] -> grab_torch2
*[Leave it be] -> after_torch2

== after_torch1 ==
The cavern continues The cave leads now to a large chasm.
* {torches > 0} [You notice something glittering against the torch light in a tunnel to the side. Go towards the shine?] -> sparkle
*[Attempt to jump the chasm] -> chasm
*[Go back] -> choices2
->DONE

== sparkle ==
The room is filled with mountains of gold! All of the riches are yours! They may be a bit heavy but its worth it to bring as much with you that you can. You then notice a light seeping in from the end of the tunnel.
*[Go to the light] -> sunrise

== chasm ==
You attempt to jump the chasm. It does not end well. You die.
->END

== grab_torch2 ==
~ torches = torches + 1
You grab the torch. The handle is wet, gross.
*[Continue] -> after_torch2
->DONE

== after_torch2 ==
As you look ahead you see a large underwater tunnel in a pool of water. It appears you will have to swim through the tunnel to make it to the other side.
* {torches > 0} [Your torch also illuminates a smaller tunnel to the left of the pool that appears to go in the same direction. Will you follow the tunnel?] -> tunnel
* [Attempt to swim through] -> drown
+[Go back] -> choices2

== drown ==
You set the torch down and attempt to swim through the tunnel. You get close but run out of air and drown, whoops.
->END

== tunnel ==
On the other side of the tunnel you see a bright light. You made it through the tunnel! A new day awaits you.
->END

== sunrise ==
Looks like the sun is rising on a new day and you've made it out of the cave! I'd consider this quest a success.
->END