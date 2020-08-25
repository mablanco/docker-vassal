# docker-vassal

Docker image for VASSAL, an open-source game engine for building and playing online adaptations of board games and card games (<http://www.vassalengine.org/index.php>).

This image is built upon my Docker image for AdoptOpenJDK 8 JRE, as VASSAL versions older than 3.3 need that JVM version, not available in most modern Linux distros. VASSAL 3.3 is compatible with Java 11 and will easily run directly from the CLI.

## How to use this image

As VASSAL is a GUI application running inside a Docker container, it is necessary to launch it with extra privileges. The following command will launch VASSAL and open the GUI in the current X11 session, giving access to your modules folder and linking the container's and your computer's VASSAL setup folders:

    $ docker run -d --rm --name vassal -e DISPLAY -v $XAUTHORITY:/root/.Xauthority --net=host --ipc=host --security-opt=no-new-privileges -v <modules_folder>:/root/modules -v $HOME/.VASSAL:/root/.VASSAL mablanco/vassal

As this is tedious to type each time you want to launch VASSAL, I'd suggest assigning an alias to this command:

    $ alias vassal='docker run -d --rm --name vassal -e DISPLAY -v $XAUTHORITY:/root/.Xauthority --net=host --ipc=host --security-opt=no-new-privileges -v <modules_folder>:/root/modules -v $HOME/.VASSAL:/root/.VASSAL mablanco/vassal'

Add the alias definition to your `~/.bashrc` to persist it between reboots.

## Note on security

This way of running the container has the disadvantage of breaking container isolation. X security leaks like keylogging and remote host control can be abused by container applications.
