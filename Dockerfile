FROM debian:jessie
RUN apt-get update && apt-get install -y \
	nasm \
	xorriso \
	qemu \
	build-essential \
	curl \
	file \
	sudo \
	grub \
	grub-pc-bin
#ENV SHELL /bin/bash
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN echo "export PATH=~/.cargo/bin:$PATH" >> ~/.bashrc
COPY . /rust_os/
WORKDIR /rust_os
RUN /bin/bash -c "~/.cargo/bin/rustup update nightly-2016-05-26"
RUN /bin/bash -c "~/.cargo/bin/rustup override add nightly-2016-05-26"
