# bash

Repository of several bash scripts and resource files. Please note some items within these scripts
are specific for Mac. You should be able to intuitively discern whether they're needed for your
Linux system or if they can be removed altogether. For example, brew items are not needed for 
Linux and can be safely removed.

Also includes some dotfiles. 

# Installation

1. mkdir ~/.bash_resources
2. Put aliases and exports files in ~/.bash_resources.
   
   The original exports file is *not* included in git because it contains some sensitive information. I have
   created a sample exports file for which you can use. Just drop the .sample extension.

   Google how to create an exported variable in bash if you are unsure.

3. Put .bashrc in your home's root directory.

   Example: If your home directory is located at /home/bill,
            then you would put .bashrc file there.

   `~/.bashrc`
     **OR**
   `/home/bill/.bashrc`

4. Source the .bashrc script.

   `. ~/.bashrc`

5. If .bashrc isn't sourcing when you bring up a terminal, then you'll need to create a .bash_profile
script that sources .bashrc. Just drop the .bash_profile in your home's root directory. See included file.

6. The \_functions.sh script contains a colors() function. I used full color name definitions to make it 
easier to remember. Others on the internet used abbreviated versions of the color names which I don't 
like. 

# Utilities Folder

- rsync.sh: Simple bash script for backing up items to a remote machine.

# About Me

I'm in my 50's and have been programming and hacking since I was 13. My first time using a computer was on
an Apple 1 which instantly hooked me. My first computer was a Commodore Vic-20. I am a seasoned Software 
Engineer with multiple degrees in Engineering: Aerospace Engineering (BS), Computer Engineering (BS), and 
Software Engineering (MS). 

### Words of Advice for Fellow Programmers, New and Seasoned

1. Learn how to type. Seriously, take a typing class or some on-line tutorial. I learned how to type when I
was 14 and can currently type 70+ words per minute. I get things done quickly whether it's typing up an 
email, writing documentation or coding. I have an edge over all of my peers, both young and old. It's comical 
to watch someone who is a two-finger typists typing up an email.
2. College is expensive. However, that piece of paper helps substantially in getting a job versus someone
who doesn't have a degree. 
   - It also depends on the type of degree. A BS degree is much more powerful than a BA degree if you're 
     looking for a programming job.
   - There are always exceptions to this rule. I've known a co-worker who didn't have a degree, learned 
     programming on his own and was quite good. However, he was later required to get his degree for which 
     the company paid for it.
3. Micro degrees at accredited universities are just as good, in my opinion, and a heck of a lot cheaper. 
4. Don't be an arrogant programmer. Nobody will want to work with you, and you will be one of the first 
people laid off no matter how good you are because you've created a toxic atmosphere around you. 
   - Everyone is replaceable no matter how good you are.
5. Learn the language of business. You will have to communicate with business folks who don't know technology.
6. You **will** encounter business folks who think they know technology but don't. You can't avoid these
people, and they're next to impossible to work with. That's why #5 is very important.
7. In addition to #6, you **will** have a manager or director with no technology background other than, 
"I know how to work a computer." Give them a chance. They can be a valuable asset to help navigate with 
business folks.
8. Never. Stop. Learning. You will have to compete with younger people as you progress in your career.
9. For Americans, your competitions are mainly the Indians, Russians, and Chinese. They are very smart and 
very competent. It is another reason why #8 is very important.
10. Learn how to communicate effectively. You will get eaten alive by the business world if you're not
articulate and clear in your speaking (and writing).
11. Most companies aren't loyal to their employees. Thus, don't think you can't be terminated because you
are the "superstar" programmer in the company.
12. You are not a one person show. If you don't like working in a team setting, then become a painter.
Seriously, you're not programmer material, otherwise. Everything is about collaboration, sharing, and, 
especially, learning from others.
13. If you have a chance to work in or create a start up, do it.
14. If you're successful, don't forget about the little people and less fortunate. 
15. Give back or contribute to the open-source and freebie communities that helped you. Oh, you didn't 
use them? Of course you did, liar! You're lying if you didn't use github, Stackoverflow, Codecademy, 
W3Schools, any of the YouTube programming channels, etc.
16. Know and understand cybersecurity. 
17. Documentation is key not only for others but for yourself. If you wrote code 6 months ago, and it
had no documentation (and that also includes no comments in the code), you will waste a lot of time trying
to figure out what you did.
   - Oh, your code is self-documenting? Bull shit. I've seen enough self-documenting code in my days
     to say that it's crap. Javadocs and Doxygen weren't invented for nothing.
18. Every programmer should learn C (not C++) or Assembler. It really helps you understand how computers 
work at a low level. 
19. Don't attempt to hack into your friend's or neighbor's wifi. The consequences are huge, and the law 
will not be in your favor. Just don't do it.
20. Programming is fun. If you don't think it's fun, but you only like the paycheck, you are likely a
miserable person. 
