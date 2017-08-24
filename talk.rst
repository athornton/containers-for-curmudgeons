:css: css/talk.css

.. That's the light-background version.

.. Commenting out :css: css/talk_dark.css

..  Swap that in if you want the dark-background version

..  Random comment for Jupytercon commit

:title: Containers For Curmudgeons
:author: Adam Thornton

Containers for Curmudgeons
##########################

Adam Thornton
=============

Speaking As A Private Individual
================================

athornton@gmail.com

----

.. role:: raw-role(raw)
    :format: html

.. role:: strike
    :class: strike

Some Basics
###########

Humans are primates.

(If you disagree with that statement, you should leave this talk right now.  You will not be happy.)

That means, among other things:

* Large brain

* Nimble hands

* Easily bored

* Easily dis

Hey wow is that an Watch?

----

Which means what?
#################

You shouldn't let humans anywhere near your software deployments.

They will get it wrong.

Sometimes they just miss a step, or make a typo and some small-but-critical step doesn't work.

* Especially if they are only allowed to deploy your software between 2 and 6 AM.

* And your software package is one of thirty they're deploying during that window.

Some of this is harmless.

It's not the people who are so unambitious as to never bother to learn how to write shell scripts that are the problem.

* So you get a weird paste error or ten

* Or someone wrote your implementation plan in Word, and all the straight quotes are now curly quotes and none of the dashes are dashes anymore.

* And the bucolic, beatific operator doesn't notice that nothing's working.

That's not really a big deal.  I mean, sure, the development team is unhappy, and the customer didn't get what the business promised them, but it's not, you know, *bad*.

----

Clever is Dangerous
###################

It's the ones who *do* script things that you have to worry about.

.. code:: bash

  # Deploy the application
  DEP_ENV=prod whizzerate -infibulator --pkg-directory=$deploydir -q
  # Remove the now-deployed application package
  cd $deploydir
  rm -rf *

It saves time!  It's perfect!

* especially when ``$deploydir`` is unset ...

* so you're sitting in ``/`` ...

* since ``$HOME`` is unset or set to ``/``...

* because you're root.

----

A Radio Play
############

Casting
=======

**YOU**: Me

.. class:: pm

**PROJECT MANAGER**: OVERLY EXCITABLE AND SHOUTS IN COMIC SANS AND ALSO DOESN'T USE PUNCTUATION!

.. class:: developer

**DEVELOPER**: Sullen and sleepy.  This wasn't in the job description.

.. class:: ops

**OPS GUY**: For those whose favorite *Guardians Of The Galaxy* character was Groot.

``(timestamps) and (crickets): The chorus (everyone else).``

.. note::

  Ops: you only have two words, and they are always in the same order: "Herp" and "Derp".  But you do have to vary the inflection.
  Chorus: when it has a time, say "tick tick tick," and when it says "crickets", say "chirp chirp chirp"


----

How many times have you had this conversation?
##############################################

``(4:46 AM.  Phone rings.)``

**YOU**: Mrphgblargle.


.. class:: pm

**PROJECT MANAGER**: OH THANK GOD WE FINALLY MANAGED TO GET THROUGH TO YOU! FLORBLEFINGER 2.12.22 FAILED ITS DEPLOYMENT AND WE ONLY HAVE AN HOUR LEFT IN THE WINDOW WHY DID THIS BREAK LITTLE OLD LADIES CAN'T GET THEIR DRUGS!

**YOU**: Ugh.  What time...  Hang on.  Gotta log in.  Effin' VPN.  Stand by.

``(4:56 AM)``

**YOU**: OK.  I don't have access to the box.  What's it saying in the logs?

``(crickets)``

``(5:13 AM)``

**YOU**: The stack trace seems to show that the JVM wants to use the vbc.florblefinger.enablePoorLifeDecisions property, and it's not set.  Is there a developer here?

``(crickets)``

**YOU**: Could we get one, please?

----

The Cavalry Arrives
###################

``(5:22 AM)``

.. class:: developer

**DEVELOPER**: It works on my desktop.

**YOU**: Is your desktop in the data center?  Oh boy, did I just say that in my outside voice?

.. class:: developer

**DEVELOPER**: I dunno, that variable gets set in the default Eclipse environment we got from Application Engineering.

**YOU**: How did this get through QA?

.. class:: pm

**PROJECT MANAGER**: THIS RELEASE WAS FAST-TRACKED BECAUSE BY THE TIME ARCHITECTURE WAS DONE WE NO LONGER HAD BUDGET FOR A FULL QA CYCLE.

**YOU**: And a *non-full* QA cycle would be...?

``(crickets)``

----

Doing The Needful
#################

**YOU**: Can we get an App Eng res...you know what, never mind.  Hey, ops guy?

.. class:: ops

**OPS GUY**: Herp! Derp!

**YOU**: Can you please use a text editor to open the florblefinger wrapper script?

.. class:: ops

**OPS GUY**: Herp?  Derp?

**YOU**: Can you please share your screen?

``(5:49 AM)``

**YOU**: OK, now type the letter i.  Now type the minus sign.  Now type capital D.  No.  Ca... *(sigh)*  Escape.  H.  R.  Hold down shift.  Type D.  Let up shift.  Vee-as-in-vomit...

``(5:54 AM)``

**YOU**: Escape.  Colon....Colon.  As in where your hea...er, hold down shift and press the key right of L.  Now type W, then Q.  Hit Enter. *(deep breath)* OK.  Now, please follow the last three lines of the Implementation Plan.

.. class:: ops

**OPS GUY**: Herp. Derp.

``(5:58 AM)``

**YOU**: Welp, looks like it's working.

.. class:: pm

**PROJECT MANAGER**: GREAT!  I'LL SEE YOU IN ROOM 211B AT 8:00 SHARP FOR THE POST-DEPLOYMENT DEBRIEF!  GREAT JOB EVERYONE, WE GOT THE RELEASE INTO PRODUCTION!

----

The Post-Deployment Debrief
###########################

``(8:05 AM)``

.. class:: pm

**PROJECT MANAGER**:  GREAT!  WE HAD A SUCCESSFUL DEPLOYMENT LAST NIGHT BECAUSE I DID SUCH A GREAT JOB MANAGING THE PROJECT THAT I AM THE BESTEST PROJECT MANAGER IN THE HISTORY OF PROJECT MANAGERS AND I AM SURE MY BONUS WILL...

``(8:56 AM)``

.. class:: pm

**PROJECT MANAGER**: ...SO CONGRATULATIONS TEAM AND LET'S GET FOCUSED ON OUR NEXT RELEASE WHICH WILL BE IN 86 DAYS AND...WHAT IS IT **NOW**?

**YOU**: So, Project Manager, can you please get Development's manager to pinky-swear that they will actually put the properties into the script wrapper for the next release?  And maybe ask whoever owns Application Engineering to have someone update their docs to make it clearer that Development needs to do that in the general case, even if the values are provided in the development environment?

.. class:: pm

**PROJECT MANAGER**: SURE!  I WILL SET UP ONE RECURRING MEETING BETWEEN YOU AND A LOW-LEVEL DEVELOPER TO WHOM NO ONE WILL LISTEN TO PRIORITIZE THE SWEARS AND PROPERTIES *(click click)* ON ALL MONDAYS AT 7:30 AM AND THEN ANOTHER RECURRING MEETING BETWEEN YOU AND A CHECKED-OUT CONTRACTOR WHO IS JUST WAITING FOR HIS PAPERWORK FROM ANOTHER VERY BIG ENTERPRISE TO COME THROUGH TO WRAPPING OF THE SCRIPTING GENERAL DOCUMENTATION CASE *(click click)*  ALTERNATING FRIDAYS AT 5:30 PM AND TUESDAY AT NOON SORRY ABOUT THE LUNCH MEETING BUT THAT WAS THE ONLY TIME YOU WERE OPEN LOL!  WELL WE'RE OUT OF TIME GOOD JOB EVERYONE!

*(spoiler: the properties never go in the wrapper and this conversation happens every three months until you leave the company)*

----

:data-rotate: -180
:data-x: r-2000
:data-y: r-1100

Things You Want In A Deployment
###############################

The same thing that left dev, and got tested in QA, is the thing that goes
to production.

* Some sort of manifest showing what went into the deployable artifact,
* With some kind of checksums,
* And, ideally, a set of cryptographic signatures going back to some trusted root that establishes a chain of custody.

The deployment machinery is also well tested, and the same machinery functions in all environments after the developer's desktop.

* The deployment machinery deploying itself would be ideal here.

----

A Deployment Culture You Want
#############################

Developers are given clear guidelines as to how they must package their applications to be picked up by the deployment machinery.

Their timelines include budget for getting the desktop-to-dev transition handled.

People aren't afraid of deployments anymore, because the software works reliably.

In fact you usually do rolling deployments in the middle of the day, and hardly ever start something big at 4:45 on Friday.

There is a strong cultural bias AGAINST middle-of-the-night heroics and FOR if-it-breaks-send-it-back: right is more important than Right Now.

----

And you also want a pony.
#########################

.. image:: images/pony.jpg
  :height: 600px

.. note::

 Public domain image, http://www.publicdomainpictures.net/view-image.php?image=52498&picture=pony&large=1

----

:data-y: r-1100

So here's one way to try to get there
#####################################

The *last* time I tried this, I *tried* to drink the Kool-Aid.

* We were a Red Hat shop, so we went with:

 * All artifacts were RPMs.

 * All files were tracked in RPMs.

 * Config files were not edited by hand.

These seemed like pretty simple precepts to follow.

----

Disaster
########

It was a miserable failure.

The commitment to RPMs was superficial.

* No one but me thought being able to verify contents was important.

* ``%config`` is too hard for people.

* ``%config(noreplace)`` ?  Fuggedaboutit.

* But we need multiple versions of the same service on the same host at the same time!  Because reasons!

No one reads documentation.  Ever.

* So the things that had interfaces to change them (e.g. "create this folder structure, put files in it with names like *foo* and contents like *bar*...") were roundly ignored...

* In favor of having someone with supervisory powers log in and hard-code defaults for that environment.

* And then come back and yell at us when promotion from dev to QA to prod broke, because *obviously* it was *our* fault.

* When does Missouri get medical marijuana?

 * Or did that happen already, and everyone knows but me?

----

This time around
################

Most places are running some OS now that will support Linux kernel namespaces and hence Docker.

* If you're still on RHEL 5, may God have mercy on your soul.

* Docker is slowly gaining the ability to run on other platforms natively.

 * You can also do the Docker-on-Windows-or-OS-X thing of running Docker on a Linux VM inside VirtualBox (or another full-machine-virtualization engine) on the host OS.

Let's figure out how to containerize.

----

Containerization, in General
############################

Provide isolation between multiple services running (perhaps) on the same hardware.

Why is that not, just, y'know, a process?

Because people are stupid.

OK, OK, maybe that's a little harsh.

The short answer is: conflicting namespaces.

* IP Addresses/Ports

* Paths

* Users/userids

Linux kernel namespaces provide containers with their own set of each of these, as well as PIDs, which you don't generally directly care about, the hostname, ditto, and System V IPC, which needs a stake through the heart.

----

Why containerize at all?
########################

So, sure, you can overcome all these problems by adhering to rigorously followed conventions.

* In platform *X*, you will have the following environment variables available:

 * You will use ``$HTTPS_LISTENER_PORT`` rather than hardcoding it.

 * Yes, that's right, it's not in your Eclipse environment.  You'll need to provide it there or use this script we've written for you...

 * Yes, that's right, it's also not in the environment you see when you log in as the mule user to the dev box, because you can have up to four horizontal instances, and so the offset is calculated at....

  * NO!  You can't just set it in your ``.profile``!  Stop it!

See, above, "no one ever reads documentation," and "miserable failure."

----

The Easy Way
############

Or you can just run the application in a container, which is only a little more heavyweight than a process, but looks like it has:

* Complete filesystem

* Own IP address with all :raw-role:`2<sup>16</sup> - 1` ports available

* Own set of userids (or, just, "sure!  you're root!" within the container)

Which, OK, isn't as elegant as doing it all with nifty environmental setup scripts and clever shell-evaluations to get variable names, but might be a little more approachable.

So, in retrospect, maybe "Read the docs!  Trust the environment!  Don't act like flinging your feces at onlookers is the highest action of which you are capable!" wasn't the hill to die on.

----

Brief rant about DevOps
#######################

You can't just drop DevOps into an existing organization without cultural and structural changes.

In a traditional enterprise with separate silos for Operations, Engineering, and Development, developers will almost certainly behave like a bunch of crack-addled gibbons whose only concern is to charge through eighty gajillion sprints all focussed on feature introduction and none at all on fixing bugs and then get their thing running on their lovingly hacked-up personal box and then, with mere seconds to spare before the hard deadline for "you missed your window," chuck it over the wall to Operations, whose job it is to get it running in production, to support it, and to point fingers at Engineering (whose actual role, *vis-á-vis* Development, has been "to be ignored") when it inevitably immolates itself in a giant conflagration of suck.

Enabling this behavior is like giving a playground full of toddlers a handle of tequila, a barrel of sharp knives, a can of gasoline, a box of strike-anywhere matches, six ounces of crystal meth, and half a pound of plutonium.

You might have guessed that my background is not in software development.

----

Crack-Addled Gibbon
###################

.. image:: images/saw.png
   :height: 600px

That's just some idiot with a chainsaw, not a crack-addled gibbon.

----

Crack-Addled Gibbon
###################

.. image:: images/rob_ford_crack.jpg
   :height: 600px

Nope, that's Rob Ford, former :strike:`(and perhaps future)` mayor of Toronto.  Getting warmer, though.

----

Crack-Addled Gibbon
###################

.. image:: images/Crack_Gibbon_Small.png
   :height: 600px

There we go.

----

That Was Slightly Unfair
########################

It's not that developers really *are* crack-addled gibbons.

Rather, it is that enterprises provide them with perverse incentives that reward crack-addled gibbonoid performance.

.. image:: images/LoveIsInTheAir.jpg
  :height: 400px

*Perverse Incentives* is also the name of my Hank Greenberg / Jamie Dimon slashfic novel, available soon on Kindle.

----

:data-rotate: 90
:data-x: r2000
:data-y: r1600

Zen
###

No one cares about your infrastructure.

:data-rotate: 0

----

Slightly less Zen
#################

The only things people care about are your exposed endpoints.

|

|

|

|

That sounded dirty.

----

:data-x: r-1100
:data-y: r2000

Service Monitoring
##################

Continuous values (or even a large set of discrete values) are for chumps.

No one cares whether your host is 2% utilized or 78% utilized. [*]_

All anyone cares about is the service behind the endpoint, and for that only:

* Is it OK or not? [*]_

 * Which actually means, is it responding accurately to more than some threshold percentage of requests within a certain threshold of time?

 * You may want to keep the measured values if you're trying to predict when it's going to go from OK to Not OK.

 * But in that case, just warn the user that the threshold is approaching and your best guess as to when it's going to be crossed.

 * Digging out the supporting data should be a rare event and it's OK not to cater to it.

.. [*] If you're on your own hardware, and you're not virtualizing...wait, why are you not...oh, never mind.  Let's go with, this *should* be true.

.. [*] **FINE** you can have Green, Yellow, and Red, if you must: OK, Not *Really* OK, and *Really* Not OK.

----

 :data-rotate: 180
 :data-x: r3000
 :data-y: r-3000

So, OK, That's Nice, but Totally Not My Use Case
################################################

Fair enough.  So how about a story that goes like this?

* We're scientists.

* We write code for ourselves.

* This code has the following features:

 * Embedded hardcoded paths relative to four different researchers' home directories...

 * With some fancy ``/etc/group`` work and permissions to allow data exchange...

 * And relies on some antediluvian version of some library, because it worked with libfoo 3.2 but broke with 4.0 and who has time to chase that down?

----

:data-x: r-4800
:data-y: r0

The Problem With That Is?
#########################

Well, nothing, as long as you and five people down the hall are actually the only ones using your code.

But then you need to collaborate with someone who doesn't sit twenty feet away and with whom you haven't been working for the last fifteen years.

----

:data-x: r-2000

Data
####

Let's assume you can agree on a data format both sides of the collaboration will use.

* Or at least, some straightforward preprocessor to turn the data into a mutually-acceptable form.

There sure is a lot of data.

*Ayup.*

Way too much to ship back and forth.

*Yup.*

(There may be other political/priority/funding reasons you cannot exchange the data.  But the size consideration would be sufficient.)

----

If Mohammed Will Not Go To The Mountain...
##########################################

So you can't move the data.

You don't have much choice but to move the computation, do you?

How do you do that?

----

If My Wife's Experience in Biology is Any Indication...
#######################################################

What you do is send your collaborator the analysis program, and then spend tens of hours over the next few weeks just making the software work.

* Tons of tedious hand-hacking of the code.

* Layered-dependency hell.

* Eventually, either:

 * Someone destroys their own environment and can't work on their own stuff anymore, because Frobnoid 14.3, required by the program, is not compatible with Frobnoid++ 2008, which is what used to be on the machine before this ill-starred collaboration happened.

 * Someone installs a virtual machine because they are (justifiably) scared of the above and then discovers the joy of trying to install archaeological software on a modern system.

  * Novice: Dude, where's my CD?

  * Intermediate: Dude, where's a working floppy drive?

  * Expert: Dude, where's a nine-track tape drive and a bus-and-tag-to-Centronics-parallel adapter to plug into a parallel-to-USB adapter?

  * Death Incarnate: Dude, has anyone seen a punch card reader around here?

----

The Fun Is Just Beginning!
##########################

This gets *much* worse once it seems to be working—it's running for a long time and emitting output—but their run of the test case doesn't agree with your run.

* Debugging why the program's behavior is different on each end *is* more fun than:

 * eating broken glass

 * setting yourself on fire

 * gouging your eyes out with a spork

* Barely.

----

The Software Engineering Solution
#################################

Well, obviously, the correct answer is, you rewrite all this old broken code into something modern and supportable.

And while you're at it, remove all the hardcoded stuff and make it configuration-service driven.

Oh, and parallelizable, preferably with some nifty annotation-based widget that automagically fires up instances on a public cloud and splits the data processing among them.

And document the data format and software version dependencies.

And a pony.

----

.. image:: images/pony.jpg
  :height: 600px

.. note::

 Public domain image, http://www.publicdomainpictures.net/view-image.php?image=52498&picture=pony&large=1

----

Containerization: Sort of Like a Closure Over Your Software Environment
#######################################################################

I meant that in the CS sense of a function that has an environment bundled with it, but thinking of it as a wound closure works too.  Maybe better.

The great thing about containers is they let you get away with sloppiness.

I only mean this *semi*-ironically.

----

Containerize Your System, the 30-second Guide
#############################################

Seconds 1-15
============

* Start with the program or sets of programs you will run [*]_.

* Inject all the dependencies you need.

 * No need to worry about doing it the right way: just throw the library binaries, framework templates, ancient, buggy, security-vulnerable versions of Java, whatever in there higgedly-piggledy!

* Test it.

.. [*] First make sure it can run on Linux with a modern kernel.  I'm looking at *you*, vital piece of equipment that talks over a Centronics parallel cable and for which the latest (and proprietary) device driver was written in 1990 for MS-DOS 3.3, by a company that hasn't existed since 1993.

----

Containerize Your System, the 30-second Guide
#############################################

Seconds 16-30
=============

* Figure out how to do that same process without human intervention.

 * It doesn't matter **HOW** hideous or fragile the shell script [*]_ is that gets it done.

  * You can pipe literal strings into it where you'd usually type things

  * Run expect.

  * Use other hastily written shell scripts or text files as input.  How gross it is really doesn't matter.

 * Copy that automated process into your container as a ``COPY`` line in the Dockerfile.

 * Have your Dockerfile run it as part of the build with ``RUN``.

* And now, anyone capable of running Docker can run your app in all its tentacular glory.

* *IA!  Fthagn Cthulhu!*

.. [*] Or, you know, a program to do all the packaging written in FORTRAN, if that's more your style.  That's the point.

----

So, What You're Saying....
##########################

Is that this whole containerization thing is just a way to hastily paper over shoddy software engineering and bad design decisions?

Yes.  Yes I am.

----

A Little More Zen
#################

No one cares about your software engineering either.

----

:data-rotate: 90
:data-y: r2000
:data-x: r0

Remember the Service Monitoring Slide?
######################################

This test is not graded on a curve.  It is straight up pass/fail.

Does the software work, or doesn't it?

*(P.S. I'm done with those silly slide transitions.  But, you know, I was using Hovercraft, so I had to try 'em.)*

----

Designing the Application
#########################

You may not get much control over this.

A generic application needs, probably, the following:

* Exposed endpoints
* Persistent data store
* Service locator
* Orchestrator
* Actuators

Often, however, the Orchestrator and the Service Locator are implicit or manually configured (either at installation, or every single time the service is used)

:data-rotate: 0

----

A Sanitized Case Study
######################

Some software that I might have some connection to through some organization I'm carefully not mentioning in this talk might have the following characteristics.

It exposes:

* an HTTPS port as its public interface,

It has a bunch of components (most are "actuators"):

* Data containers for persistent data.

* Infrastructure services to provide:

 * Service location.

 * Data store.

 * Some kind of encrypted storage for sensitive data.

 * Some method of ensuring secure and authorized communication between components.

 * Orchestration.

* Business logic layers

:data-x: r0
:data-y: r1600

----

Choice of Underlying Technologies
#################################

Pick a primary language you're working in.  It's not necessary that all your components be in the same language but it does make a lot of things easier.

Choose things with Open Source licenses.  Maybe not for the obvious reason.

* Dependency on a commercial component instantly means your reach is restricted to that component's customers.

 * Even if you Open Source your stuff, you're still just an add-on to their thing.

 * Then you have to deal with either telling the customer how to configure the thing, or you have to sell a prebundled thing, and ugh.

* The bother and hassle of dealing with license management, especially inside a containerized environment, makes that a nonstarter, especially when it needs its own black-box license manager node.

* A containerized application is very likely to have highly elastic sizing :raw-role:`&mdash;` if it isn't Open Source, either you will have a complicated, difficult-to-comprehend licensing model, or you will pay way, way too much.  Or both.

* There are some people, and I'm not naming any names here, who believe Larry Ellison has enough yachts already.

:data-y: r0

----

Choosing a language
###################

I'm a big fan of Go right now.  Go is a lovely language.  It's like C, if C had been rebuilt after thirty-five years of observation of where C worked and where it didn't work, and with a 2007 view of what resources were cheap and what were expensive, not a 1970 view.

*(which is pretty much what it is)*

I now resent having to write stuff in Python.  Think about that for a second.

Remember back in the old days, before Perl, when if you wanted to do something you couldn't easily do in a sh/awk/sed pipeline, you'd reach for the C compiler?  Go makes that seem like a reasonable idea again.

I find that the gap between, "I have something that is syntactically valid," and "I have a correct program," is consistently *way* smaller in Go than in anything else I've used, and I've used a lot of languages.

Static linking is really nice in a containerized environment, since you don't end up with the dozens and dozens of supporting packages you would need for an application in, say, Python.

 * This does require that container rebuilds and redeployments are actually trivial to perform, of course.

(Yes, I realize the cool kids are on to Rust now; I haven't really wrapped my head around it but it feels like it puts a whole lot of the burden on making sure the compiler is really, really right.  I'm not sure how good an idea this is.)

----

Exposed Endpoints
#################

Your exposed endpoint should probably have a real TLS certificate, signed by a real certificate authority, so people's browsers don't get angry.

Your internal services do not need certificates signed by any place real.

* They need to trust each other; you don't care if anything else trusts them since nothing else should ever be able to see them

* Unless you are in fact a public CA, or you have oodles of money, it's pretty cost-prohibitive to get signed-by-a-public-CA certificates for everything, especially if you have a dynamically-scaled infrastructure.

You're probably going to want a proxy/load-balancing/distribution layer in front of your services anyway.  I like HAProxy.  Your mileage may vary.

* Give the public endpoint the public-facing "real" cert, then reencrypt to your backend using an internal cert signed by your private CA.

* Sure, there are some applications that cannot stand the performance hit of decrypting-and-reencrypting at the proxy.  Those are not the general use case.

----

Service Location
################

DNS is pretty traditional for this.  Not great if you have Java clients, since Java doesn't respect DNS TTL unless you jump through some hoops.

* Your legacy applications are unlikely to have those hoops.

You may want to farm service location out to your data store.

* Your key-value store (if you have one) may well have a DNS interface as well.

----

Data Store
##########

First, do you need a lightweight, small key-value store, or something that looks a lot more like a database, or both?  Choose wisely.

If you use a key-value store, you will likely end up choosing between etcd, consul, and zookeeper.  My experience with etcd has been pretty bad (it's not very robust against sudden poweroffs), with consul has been good but I hear it doesn't scale super-well, and I haven't used zk.

If you need a real database, do you need a relational database, a NoSQL database, or both?  Choose wisely.

Check the licenses.  And if you pick something that is commercial but with a freely available community edition, do your homework to see whether fixes ever get backported to the community edition.  Couchbase, I'm looking at you.

----

Encrypted Credential Storage
############################

You can write your own, but why?

Vault (https://vaultproject.io) seems pretty good.

* Licensed under the totally-reasonable Mozilla Public License 2.0.

* It's hard to get this stuff right on your own.

Yes, *fine*, Keywhiz (https://square.github.io/keywhiz/).  But then, Java.  Ew.

----

Securing Inter-component Communication
######################################

That's what TLS is for.  Specifically, TLS with client authentication.

* Almost everything in your application should only need to talk to other parts of the application.  That means you don't need a public CA to do this.

* Create a private CA, build and sign all the certs used for your components, and then throw away the passphrase.  Now you have a sealed, secure system.

* I wrote a tool to make this easier: uCA.

----

uCA
###

This is barely even its own thing.  It's just OpenSSL with a thin wrapper around the CA stuff.

The motivation is pretty simple.

* Need to be able to validate connections our components make to each other.

 * Mutual-auth TLS seems like the right tool for that.

 * If we burn the CA signing passphrase as soon as we're done with it, it's pretty secure.

Only the external-facing endpoint needs a "real" certificate.

----

Surely That's Not Hard
######################

It shouldn't be, should it?

The OpenSSL command-line interface is :raw-role:`&#x1F4A9;` (``U+1F4A9``).  Have you ever tried to:

* Sign a certificate with OpenSSL's CA,

* That used SANs,

* That didn't require you to rewrite openssl.cnf each time you changed the SAN you want?

This turns out to be a very tricky dance of the environment, the certificate signing options, and the configuration file.

.. note::

 How great is it that there's a Unicode Pile Of Poo character?  As soon as Unicode 7.0 is widely adopted and everyone has U+1F595, I can consolidate my communications to exactly two characters.

----

I Couldn't Find Anything That Did What I Wanted
###############################################

Everything already extant I found fell into one of a few camps:

* Designed for manual use only, sometimes with an actual X GUI (e.g. xca)

* Doesn't let you do SANs (xca, and apparently, all other OpenSSL wrappers)

* Too-tightly-coupled to a whole giant stack of stuff I don't want (dogtag)

* Way, way, *way* too big, complicated, and feature-rich (OpenCA, EJBCA)

So I wrote uCA, after spending a long time figuring out the right set of incantations from a slurry of plaintive Stack Overflow questions, half-baked OpenSSL tutorials, forays into its so-called documentation, and sheer bloody-minded determination.

Apache Public License v. 2.0

https://github.com/gonkulator/uCA

----

But Then Vault Came Along
#########################

Vault actually can generate certificates with SubjectAltNames.

* You still need to bootstrap it with a CA certificate and key.

* You will need to pre-create and set up the Vault-to-its-storage backend communications path over TLS.

  * Assuming that you want Vault to talk to its backends securely.

  * You do.  Duh.

* Without the need to do SANs, you could use OpenSSL directly to do the bootstrapping without too much pain.

* Still, uCA makes it easy.  What I recommend is uCA to bootstrap your Vault CA, and then use Vault as your certificate issuer.

----

Orchestration
#############

Your application is going to be, at some fundamental level, about doing particular operations in a particular order.  Some of these operations are gated on other ones.

There are zillions of ways to do this.

* Something like Ansible to structure playbooks to ensure things happen in the right order.

* A queueing system, which implicitly defines a data flow in its queue topology.

* A configuration management system that looks for convergence to the desired state.

* Some benighted unfortunate reading from a coffee-stained page of faxed instructions from the 1990s.

Ultimately your choice of technologies here is very application-dependent.

----

Why Use Docker In Particular?
#############################

Let's grant that we want containers because of all that stuff about namespaces I burbled earlier.

Bare LXC is kinda tough and fiddly to do.

Doing namespace/cgroup manipulation directly through system calls would be much worse.

Rocket doesn't need docker, but it makes systemd your container-controlling process directly.  Your call, I guess.

* Buy me whiskey and I'll tell you what I think of systemd, Lennart Poettering, the speck in your neighbor's eye, et cetera.

  * It may take quite a lot of whiskey.

  * Really, *a lot*.

Docker pretty much works.

Docker can even be used like lightweight full-machine virtualization if you really want to do that, even if all the cool kids will sneer.

----

Decoupling Credential Persistence
#################################

Any system is going to need to have some sort of credentials embedded in it; access control, securing communications, something.  Even if you're using Vault, there's ultimately going to be some bootstrap stuff that ends up being plain old files in directories.

* These credentials clearly do not belong in a source repository.

I recommend putting them in a data container.

Why not just put these inside whatever container needs them?  Why the data container complexity?

It decouples credential persistence from app (and data) persistence.

* You can rebuild the app and leave credentials untouched, without having to be super-careful about the build process.

* If you need credentials shared between components, you don't have to worry about keeping multiple copies in sync.

----

Data Containers
###############

Data Containers are the portable way to persist data across multiple installations of Docker.

A Data Container contains:

* The data we want at the path we want it.

* ``/etc/passwd`` from the target system

* ``/etc/group`` from the target system

* Note that if you're running as root (inside the container) you don't need to bother with passwd/group since everything will by default be owned by ``root/root``.

There are a few considerations when using them, which are not all obvious.

* They're necessary but not sufficient.

* You may want some mechanism to bound their growth.

* You can leverage the underlying filesystem to help manage some of the issues.

* Prior to Docker 1.8 you needed to do a lot of work to make this actually work like you'd expect it to.  Since then, data persistence and limiting data growth have become much easier.  Use 1.8+.

----

Multi-container applications
############################

More to keep track of than an app that's just a process.

Talking to pretty much anything outside your process has to be treated as an off-box call.

* To some degree, "it depends" :raw-role:`&mdash;` if you've installed your app atop a fairly full distribution, than you can still shell out to external programs or pipe through sed or whatever if you really want to.

 * People will sneer at you for running a "fat container," but whatever.  They're not the boss of you!  (unless they are)

* These days, RPC is typically a message sent over https, for most things.  Sun RPC is, thankfully, very seldom seen anymore.

If you treat everything as living a TCP connection away, then you don't care where it's hosted, as long as you know how to get there.  That's easy with linked Docker containers, but once you're running on more than one Docker host...

----

Multi-container networking
##########################

Networking gets weird fast with multiple Docker hosts:

* A Docker network is generally just a virtual network segment only visible to Docker and its guests...

* But you can bridge it into the external network

* Or you can forward ports from the containers to the host

 * And then use iptables, a proxy, or Docker-running-with-privilege to hook those up to external well-known ports.

 * Or, if you prefer, use DNS to return SRV records for your various services.

* Or use something like Flannel or Weave to set up a virtual VLAN for your hosts.  Performance will suffer, but that may be acceptable.

----

Orchestrating Multiple Containers
#################################

Ummm, yeah.  You have a lot of options and I don't think there's a clear general-purpose best bet yet.

* Fleet

* Kubernetes

* Mesos + Marathon

* Docker Swarm

This space is still pretty immature.  Like workflow orchestration, this is one where I think the right answer depends very strongly on your specific application.

----

Questions?
##########

Not like I have answers.  But I'll do my best.

Adam Thornton

athornton@gmail.com
