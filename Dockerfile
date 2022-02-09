FROM saschpe/android-ndk:31-jdk11.0.13_8-ndk23.0.7599858-cmake3.18.1

ARG CMAKE_VERSION=3.22.2
ENV ANDROID_NDK_HOME=$NDK_ROOT
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmake/$CMAKE_VERSION/bin

RUN apt install --no-install-recommends -y \
	libssl-dev \
	zlib1g-dev \
	gperf \
	build-essential

RUN	apt install --no-install-recommends -y wget; \
	wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz -O cmake.tar.gz; \
	tar -xf cmake.tar.gz; \
	mv cmake-${CMAKE_VERSION}-linux-x86_64 $ANDROID_SDK_ROOT/cmake/$CMAKE_VERSION; \
	rm cmake.tar.gz

VOLUME [ "/app" ]
WORKDIR /app
