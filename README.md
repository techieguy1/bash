# bash

Repository of several bash scripts and resource files. Please note some items within these scripts
are specific for Mac. You should be able to intuitively discern whether they're needed for your
Linux system or if they can be removed altogether. For example, brew items are not needed for 
Linux and can be safely removed.

Also includes some dotfiles. 

## Installation

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

## Utilities Folder

- rsync.sh: Simple bash script for backing up items to a remote machine.

## About Me

I'm in my 50's and have been programming and hacking since I was 13. My first time using a computer was on
an Apple 1 which instantly hooked me. My first computer was a Commodore Vic-20. I am a seasoned Software 
Engineer with multiple degrees in Engineering: Aerospace Engineering (BS), Computer Engineering (BS), and 
Software Engineering (MS). 

### Words of Advice for Fellow Programmers, New and Seasoned

1. Learn how to type. Seriously, take a typing class or some on-line tutorial. I learned how to type when I
was 14 and can currently type 70+ words per minute. I get things done quickly whether it's typing up an 
email, writing documentation or coding. I have an edge over all of my peers, both young and old. It's comical 
to watch someone who is a two-finger typists typing up an email.
1. College is expensive. However, that piece of paper helps substantially in getting a job versus someone
who doesn't have a degree. 
   - It also depends on the type of degree. A BS degree is much more powerful than a BA degree if you're 
     looking for a programming job.
   - There are always exceptions to this rule. I've known a co-worker who didn't have a degree, learned 
     programming on his own and was quite good. However, he was later required to get his degree for which 
     the company paid for it.
1. Micro degrees at accredited universities are just as good, in my opinion, and a heck of a lot cheaper. 
The unrelated classes are not needed (history, philosophy, foreign language, etc.). Micro degrees focus on 
the skillset(s) you need.
1. Don't be an arrogant programmer. Nobody will want to work with you, and you will be one of the first 
people laid off no matter how good you are because you've created a toxic atmosphere around you. 
   - Everyone is replaceable no matter how good you are.
1. Emphasizing the previous point, if you're cocky and a dick of a programmer, you will get isolated until 
you're pushed out and replaced. Everyone is replaceable. 
    - Oh, you're the best out there? Bull shit. There's always someone better than you.
1. Learn the language of business. You will have to communicate with business folks who don't know technology.
1. You **WILL** encounter business folks who think they know technology but don't. You can't avoid these
people, and they're next to impossible to work with. That's why the previous point is very important.
1. In addition to the above, you **WILL** have a manager or director with no technology background other than, 
"I know how to work a computer." Give them a chance. They can be a valuable asset to help navigate with 
business folks while learning the business language. 
1. Never. Stop. Learning. You will have to compete with younger people as you progress in your career.
1. For Americans, your competitions are mainly the Indians, Russians, and Chinese. They are very smart and 
very competent. It is another reason why you should Never. Stop. Learning. 
1. Learn how to communicate effectively. You will get eaten alive by the business world if you're not
articulate and clear in your speaking (and writing).
1. Most companies aren't loyal to their employees. Thus, don't think you can't be terminated because you
are the "superstar" programmer in the company.
1. You are not a one person show. If you don't like working in a team setting, then become a painter.
Seriously, you're not programmer material, otherwise. Everything is about collaboration, sharing, and, 
especially, learning from others.
1. If you have a chance to work in or create a start up, do it.
1. If you're a successful programmer, don't forget about the little people and less fortunate. 
1. Give back or contribute to the open-source and freebie communities that helped you. 
    - Oh, you didn't use them? Of course you did, liar! You're lying if you didn't use github, 
      Stackoverflow, Codecademy, W3Schools, any of the YouTube programming channels, etc.
1. Know and understand cybersecurity. 
1. Documentation is key not only for others but for yourself. If you wrote code 6 months ago, and it
had no documentation (and that also includes no comments in the code), you will waste a lot of time trying
to figure out what you did.
    - Oh, your code is self-documenting? Bull shit. I've seen enough self-documenting code in my days
      to say that it's crap. Javadocs and Doxygen weren't invented for nothing.
1. Every programmer should learn C (not C++) or Assembler. It really helps you understand how computers 
work at a low level. 
1. Don't attempt to hack into your friend's or neighbor's wifi. The consequences are huge, and the law 
will not be in your favor. Just don't do it.
1. The best Linux distro is the one that you're most comfortable using. Stop with the Linux distro wars.
1. Likewise, the best O/S is the one that you're most confortable using. Each O/S has their advantages
and disadvantages.
    - I use MacOS, Linux, and Windows equally.
1. If you're in your 30's and 40's and still gaming on the weekends and into the wee hours of the night, 
it's time to grow up.
    - Oh, gaming passes the time, and it's fun? Well, those Indians, Russians, and Chinese will always 
      have an edge on you, and you've jeoparized "Never. Stop. Learning."
1. Don't ever skimp out of getting a good monitor. Your eyes will thank you.
1. If you do a lot of virtualization, it's way cheaper to buy a gaming system than a server/workstation
(if you're not running a business). 
    - P.S. Don't play games on it!
1. Sleep is extremely important. Don't ever let your employer work you until you drop. Lack of sleep
equals lots of mistakes, low quality code, and burn-out. Programmers who work in areas where lives are at 
stake, take heed.
1. Be nice but not too nice. People will walk all over you if you are too nice.
1. When shaking hands with someone for the first time, do make sure it's a firm handshake. Unfortunately, 
people will judge you in the first second of that handshake. It's an egotistical and judgemental world out 
there.
1. Explain, present, and speak with confidence. People, especially leaders, tend to respect you more. 
Again, it's an egotistical and judgemental world out there.
1. Programming is fun. If you don't think it's fun, but you only like the paycheck, you are likely a
miserable person. 
