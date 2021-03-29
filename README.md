## About

I've created this docker image to reutilize between amxmodx modules compilations since most modules requires same headers and I don't feel like using old glibc systems or GCC versions as well. I did it for myself, but if you got here somehow, feel free to use it. More usage instructions below.


## Considerations

Although this repository offer a very simple way to use this docker image, you might want to study a bit of [Docker](https://docs.docker.com/get-started/) before trying it.


## Building image

Firstly, you need to build this image.
You can do that by running the following command inside this repository path:

```bash
docker build -t ambuild .
```

The command above will build an ubuntu container based on `glibc 2.23` with [GCC 5.4](https://packages.ubuntu.com/xenial/gcc), [32-bit libraries](https://packages.ubuntu.com/xenial/libc6-dev-i386), [AMBuild](https://github.com/alliedmodders/ambuild) and required headers for compiling most amxmodx modules (such as [Metamod](https://github.com/alliedmodders/metamod-hl1), [HLSDK](https://github.com/alliedmodders/hlsdk), [AlliedModders Template Library](https://github.com/alliedmodders/amtl)).


## Running the container

Once image is built, you can run it by running the following command on terminal (assuming your terminal points to this repository folder):

```bash
docker run -it --rm -v `pwd`/src:/src ambuild bash
```

Once running, the `./src` folder inside this repository will be available inside `/src` path inside the container.

If you feel like, you can run this image anywhere by doing this:

```bash
docker run -it --rm -v `pwd`:/src ambuild bash
```

You can also remove `--rm` argument if you pretend to commit container changes after exiting.


## Container paths

Path            | Content
----------------|-------------------------
/src            | Container volume where you can access your working files
/data/metamod   | [Metamod](https://github.com/alliedmodders/metamod-hl1) headers
/data/hlsdk     | [HLSDK](https://github.com/alliedmodders/hlsdk) headers
/data/amtl      | [AlliedModders Template Library](https://github.com/alliedmodders/amtl) headers