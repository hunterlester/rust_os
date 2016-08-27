# Learning systems programming from [intermezzOS](intermezzos.github.io)
## Specs:

#### Running Debian:jessie in Docker container with `boot2docker` for Windows 10 Home edition

Windows Home edition doesn't support Hyper-V, so I'm unable to use Docker for Windows native software. This is my solution to developing on Windows.

In case anyone else needs help with the same setup:

- Install Docker tools for Windows
- Start `Docker Quickstart Terminal`
- Assuming you are in the same directory as your desired `Dockerfile`
- Run `docker build -t <docker username>/<choose a name for image> .`, in my case I'm running `docker build -t hunterlester/rust_os . <--- don't forget this period
-Next we need to get a container running from the image that we just built, with a volume mounted to our host directory so that it's easy to be able to create and write files in either the container or on our host and have them be shared.
- An important detail here is that in this case `boot2docker` is the Docker host, not our Windows OS.
- Run `docker run -d -it --name <name your container> -v <path to directory on host>:/<path to directory in container> <docker username>/<image name>
- In my case, I'm running docker run -d -it --name rust_os -v $(pwd):/rust_os hunterlester/rust_os
- The container will be running now, detached.
- Use `docker attach <container name>` to access the command line within the container. It's in here that I'm running `nasm...`, `ld ...`, `grub-mkrescure ...`, etc...
- Use `docker start <container name>`, docker stop <container name>, to start and stop your container, respectively.
- I'm writing my files either in the `boot2docker` terminal or directly in Windows in my editor. Either way the files are mounted on the `boot2docker` VM and then shared with my container.
- This is hopefully enough and helpful. Please contact me if you need help with setup. I'm not a pro at Docker, I've just spent hours and hours troubleshooting this stuff. Best is on twitter @guilfordhunter
