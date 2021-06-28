FROM saschpe/android-ndk:jdk11_api30_30.0.3_ndk22.1.7171670_cmake3.18.1

ARG NDK_VERSION=22.1.7171670
# ARG CMAKE_VERSION=3.18.1
ARG CMAKE_VERSION=3.20.5
ENV ANDROID_NDK_HOME=$ANDROID_SDK_ROOT/ndk/$NDK_VERSION
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
